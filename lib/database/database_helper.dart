import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/category_progress.dart';
import '../models/stamp.dart';
import '../models/spot.dart';
import '../models/achievement_badge.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  DatabaseHelper._init();
  //データベースの取得
  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDB('stamp.db');
    return _database!;
  }

  //データベースの初期化
  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();

    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 8,
      onCreate: _createDB,
      onUpgrade: _onUpgrade,
    );
  }

  //データベースの作成
  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE stamps(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        spot_id INTEGER NOT NULL,
        spot_name TEXT NOT NULL,
        category TEXT,
        url TEXT NOT NULL,
        comment TEXT,
        image_path TEXT,
        favorite INTEGER DEFAULT 0,
        scan_date TEXT NOT NULL
      )
    ''');

    await db.execute('''
    CREATE TABLE spots(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      spot_name TEXT NOT NULL,
      category TEXT NOT NULL,
      prefecture TEXT,
      url TEXT,
      comment TEXT
    )
  ''');

    await db.execute('''
    CREATE TABLE badges(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      badge_name TEXT NOT NULL,
      category TEXT NOT NULL,
      achieved_percent INTEGER NOT NULL,
      achieved_at TEXT NOT NULL
    )
  ''');
    await _insertInitialSpots(db);
  }

  //データベースのアップグレード
  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    // V1 → V2
    if (oldVersion < 2) {
      await db.execute('ALTER TABLE stamps ADD COLUMN image_path TEXT');
    }

    // V2 → V3
    if (oldVersion < 3) {
      await db.execute(
        'ALTER TABLE stamps '
        'ADD COLUMN favorite INTEGER DEFAULT 0',
      );
    }

    // V3 → V4
    if (oldVersion < 4) {
      await db.execute(
        'ALTER TABLE stamps '
        'ADD COLUMN category TEXT',
      );
    }

    // V4 → V5
    if (oldVersion < 5) {
      await db.execute('''
      CREATE TABLE IF NOT EXISTS spots(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        spot_name TEXT NOT NULL,
        category TEXT NOT NULL,
        url TEXT,
        comment TEXT
      )
    ''');

      await _insertInitialSpots(db);
    }
    if (oldVersion < 6) {
      await db.transaction((txn) async {
        // spot_id追加
        await txn.execute('ALTER TABLE stamps ADD COLUMN spot_id INTEGER');

        // spotsテーブル作成
        await txn.execute('''
        CREATE TABLE IF NOT EXISTS spots(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          spot_name TEXT NOT NULL,
          category TEXT NOT NULL,
          url TEXT,
          comment TEXT
        )
      ''');

        // 初期データ投入
        await _insertInitialSpots(txn);

        // 既存データ移行
        await _migrateSpotIds(txn);

        await _validateSpotIds(txn);
      });
    }
    if (oldVersion < 7) {
      await db.execute('ALTER TABLE spots ADD COLUMN prefecture TEXT');
    }
    if (oldVersion < 8) {
      await db.execute('''
    CREATE TABLE badges(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      badge_name TEXT NOT NULL,
      category TEXT NOT NULL,
      achieved_percent INTEGER NOT NULL,
      achieved_at TEXT NOT NULL
    )
  ''');
    }
  }

  //データベースに初期データを挿入する関数
  Future<void> _insertInitialSpots(DatabaseExecutor db) async {
    final countResult = await db.rawQuery(
      'SELECT COUNT(*) as count FROM spots',
    );

    final count = countResult.first['count'] as int;

    if (count > 0) {
      return;
    }
    final spots = [
      {
        'spot_name': '善光寺',
        'category': '寺社',
        'url': 'https://www.zenkoji.jp',
        'comment': '長野市の有名なお寺',
        'prefecture': '長野市',
      },

      {
        'spot_name': '戸隠神社',
        'category': '寺社',
        'url': 'https://www.togakushi-jinja.jp',
        'comment': '戸隠の名所',
        'prefecture': '長野市',
      },

      {
        'spot_name': '松本城',
        'category': '城',
        'url': 'https://www.matsumoto-castle.jp',
        'comment': '国宝の城',
        'prefecture': '松本市',
      },

      {
        'spot_name': '上田城',
        'category': '城',
        'url': 'https://ueda-cb.gr.jp',
        'comment': '真田ゆかりの城',
        'prefecture': '上田市',
      },

      {
        'spot_name': '野沢温泉',
        'category': '温泉',
        'url': 'https://nozawakanko.jp',
        'comment': '人気温泉地',
        'prefecture': '野沢温泉村',
      },

      {
        'spot_name': '白骨温泉',
        'category': '温泉',
        'url': 'https://www.shirahone.org',
        'comment': '乳白色の温泉',
        'prefecture': '松本市',
      },

      {
        'spot_name': '長野県立美術館',
        'category': '美術館',
        'url': 'https://nagano.art.museum',
        'comment': '善光寺近くの美術館',
        'prefecture': '長野市',
      },

      {
        'spot_name': '松本市美術館',
        'category': '',
        'url': 'https://www.city.matsumoto.nagano.jp/museum',
        'comment': '松本城近くの美術館',
        'prefecture': '松本市',
      },
    ];

    for (final spot in spots) {
      await db.insert('spots', spot);
    }
  }

  // 既存のスタンプデータにspot_idを移行する関数
  Future<void> _migrateSpotIds(DatabaseExecutor db) async {
    final stamps = await db.query('stamps');

    for (final stamp in stamps) {
      final spot = await db.query(
        'spots',
        where: 'spot_name = ?',
        whereArgs: [stamp['spot_name']],
        limit: 1,
      );

      if (spot.isNotEmpty) {
        await db.update(
          'stamps',
          {'spot_id': spot.first['id']},
          where: 'id = ?',
          whereArgs: [stamp['id']],
        );
      }
    }
  }

  // spot_idの整合性を検証する関数
  Future<void> _validateSpotIds(DatabaseExecutor db) async {
    // ① spot_id未設定チェック
    final nullResult = await db.rawQuery('''
    SELECT COUNT(*) AS count
    FROM stamps
    WHERE spot_id IS NULL
  ''');

    final nullCount = nullResult.first['count'] as int;

    if (nullCount > 0) {
      throw Exception(
        'spot_id未設定レコードが '
        '$nullCount 件あります',
      );
    }

    // ② spotsに存在しないspot_idチェック
    final orphanResult = await db.rawQuery('''
    SELECT COUNT(*) AS count
    FROM stamps st
    LEFT JOIN spots sp
      ON st.spot_id = sp.id
    WHERE sp.id IS NULL
  ''');

    final orphanCount = orphanResult.first['count'] as int;

    if (orphanCount > 0) {
      throw Exception(
        '存在しないspot_idが '
        '$orphanCount 件あります',
      );
    }

    // ③ 移行件数チェック
    final stampCount = Sqflite.firstIntValue(
      await db.rawQuery('SELECT COUNT(*) FROM stamps'),
    )!;

    final linkedCount = Sqflite.firstIntValue(
      await db.rawQuery('''
          SELECT COUNT(*)
          FROM stamps
          WHERE spot_id IS NOT NULL
        '''),
    )!;

    if (stampCount != linkedCount) {
      throw Exception(
        '移行失敗: '
        '$linkedCount / $stampCount 件しか '
        'spot_idへ変換できませんでした',
      );
    }
  }

  //
  Future<void> insertBadge(AchievementBadge badge) async {
    final db = await database;

    await db.insert('badges', {
      'badge_name': badge.badgeName,
      'category': badge.category,
      'achieved_percent': badge.achievedPercent,
      'achieved_at': badge.achievedAt.toIso8601String(),
    });
  }

  Future<List<AchievementBadge>> getBadges() async {
    final db = await database;

    final result = await db.query('badges', orderBy: 'achieved_at DESC');

    return result.map((e) {
      return AchievementBadge(
        id: e['id'] as int,
        badgeName: e['badge_name'] as String,
        category: e['category'] as String,
        achievedPercent: e['achieved_percent'] as int,
        achievedAt: DateTime.parse(e['achieved_at'] as String),
      );
    }).toList();
  }

  //バッジ重複防止
  Future<bool> badgeExists(String badgeName, String category) async {
    final db = await database;

    final result = await db.query(
      'badges',
      where: 'badge_name = ? AND category = ?',
      whereArgs: [badgeName, category],
    );

    return result.isNotEmpty;
  }

  //カテゴリごとの達成済みスポット取得
  Future<List<Spot>> getCompletedSpotsByCategory(String category) async {
    final db = await database;

    final result = await db.rawQuery(
      '''
    SELECT DISTINCT
      sp.*
    FROM spots sp
    INNER JOIN stamps st
      ON sp.id = st.spot_id
    WHERE sp.category = ?
    ORDER BY sp.spot_name
  ''',
      [category],
    );

    return result.map((e) => Spot.fromJson(e)).toList();
  }

  // 都道府県の一覧を取得する関数
  Future<List<String>> getPrefectures() async {
    final db = await database;

    final result = await db.rawQuery('''
    SELECT DISTINCT prefecture
    FROM spots
    ORDER BY prefecture
  ''');

    final prefectures = <String>['すべて'];

    bool hasEmpty = false;

    for (final row in result) {
      final prefecture = row['prefecture']?.toString() ?? '';

      if (prefecture.isEmpty) {
        hasEmpty = true;
      } else {
        prefectures.add(prefecture);
      }
    }

    if (hasEmpty) {
      prefectures.add('都道府県未設定');
    }

    return prefectures;
  }

  // 都道府県の一覧を取得する関数（カテゴリー別）
  Future<List<String>> getPrefecturesByCategory(String category) async {
    final db = await database;

    List<Map<String, Object?>> result;

    if (category == 'すべて') {
      result = await db.rawQuery('''
      SELECT DISTINCT prefecture
      FROM spots
      ORDER BY prefecture
    ''');
    } else {
      result = await db.rawQuery(
        '''
      SELECT DISTINCT prefecture
      FROM spots
      WHERE category = ?
      ORDER BY prefecture
    ''',
        [category],
      );
    }

    final prefectures = <String>['すべて'];

    for (final row in result) {
      final prefecture = row['prefecture']?.toString() ?? '';

      if (prefecture.isNotEmpty) {
        prefectures.add(prefecture);
      }
    }

    return prefectures;
  }

  // カテゴリーの一覧を取得する関数（都道府県別）
  Future<List<String>> getCategoriesByPrefecture(String prefecture) async {
    final db = await database;

    List<Map<String, Object?>> result;

    if (prefecture == 'すべて') {
      result = await db.rawQuery('''
      SELECT DISTINCT category
      FROM spots
      ORDER BY category
    ''');
    } else {
      result = await db.rawQuery(
        '''
      SELECT DISTINCT category
      FROM spots
      WHERE prefecture = ?
      ORDER BY category
    ''',
        [prefecture],
      );
    }

    final categories = <String>['すべて'];

    bool hasEmpty = false;

    for (final row in result) {
      final category = row['category']?.toString() ?? '';

      if (category.isEmpty) {
        hasEmpty = true;
      } else {
        categories.add(category);
      }
    }

    if (hasEmpty) {
      categories.add('カテゴリ未設定');
    }

    return categories;
  }

  //スポット一覧を取得する関数
  Future<List<Spot>> getSpots() async {
    final db = await database;

    final result = await db.query('spots', orderBy: 'category, spot_name');

    return result.map((e) => Spot.fromJson(e)).toList();
  }

  //スポットを挿入する関数
  Future<int> insertSpot(Spot spot) async {
    final db = await database;

    return await db.insert('spots', spot.toJson());
  }

  // 指定されたIDのスポットを取得する関数
  Future<Spot?> getSpotById(int id) async {
    final db = await database;

    final result = await db.query('spots', where: 'id = ?', whereArgs: [id]);

    if (result.isEmpty) {
      return null;
    }

    return Spot.fromJson(result.first);
  }

  // スタンプが存在しないスポットを取得する関数
  Future<List<Spot>> getMissingSpots() async {
    final db = await database;

    final result = await db.rawQuery('''
    SELECT
      spots.*
    FROM spots
    LEFT JOIN stamps
      ON spots.id = stamps.spot_id
    WHERE stamps.id IS NULL
    ORDER BY spots.category,
             spots.spot_name
  ''');

    return result.map(Spot.fromJson).toList();
  }

  // スポットのカテゴリーごとの件数を取得する関数
  Future<List<String>> getCategories() async {
    final db = await database;

    final result = await db.rawQuery('''
    SELECT DISTINCT category
    FROM spots
    ORDER BY category
  ''');

    final categories = <String>['すべて'];

    bool hasUncategorized = false;

    for (final row in result) {
      final category = row['category']?.toString() ?? '';

      if (category.isEmpty) {
        hasUncategorized = true;
      } else {
        categories.add(category);
      }
    }

    if (hasUncategorized) {
      categories.add('カテゴリ未設定');
    }

    return categories;
  }

  // スタンプが存在しないスポットをカテゴリーごとに取得する関数
  Future<List<Spot>> getMissingSpotsByCategory(String category) async {
    final db = await database;

    final result = await db.rawQuery(
      '''
    SELECT
      spots.*
    FROM spots
    LEFT JOIN stamps
      ON spots.id = stamps.spot_id
    WHERE stamps.id IS NULL
      AND spots.category = ?
    ORDER BY spots.spot_name
  ''',
      [category],
    );
    return result.map(Spot.fromJson).toList();
  }

  //スポットのカテゴリーごとの件数を取得する関数
  Future<int> getCategoryCount(String category) async {
    final db = await database;

    final result = await db.rawQuery(
      '''
    SELECT COUNT(*) as count
    FROM stamps
    WHERE category = ?
    ''',
      [category],
    );

    return result.first['count'] as int;
  }

  //スポットのカテゴリーごとの件数を取得する関数
  Future<int> getCategoryTotal(String category) async {
    final db = await database;

    final result = await db.rawQuery(
      '''
    SELECT COUNT(*) as count
    FROM spots
    WHERE category = ?
    ''',
      [category],
    );

    return result.first['count'] as int;
  }

  //スポットのカテゴリーごとの件数を取得する関数
  Future<Map<String, int>> getCategoryTotals() async {
    final db = await database;

    final result = await db.rawQuery('''
    SELECT
      category,
      COUNT(*) as total
    FROM spots
    GROUP BY category
  ''');

    return {
      for (final row in result) row['category'] as String: row['total'] as int,
    };
  }

  //スポットのカテゴリーごとの件数を取得する関数
  Future<List<CategoryProgress>> getCategoryProgress() async {
    final db = await database;

    final result = await db.rawQuery('''
    SELECT
      s.category,
      COUNT(DISTINCT s.id) AS total_count,
      COUNT(DISTINCT st.spot_id) AS acquired_count
    FROM spots s
    LEFT JOIN stamps st
      ON s.id = st.spot_id
    GROUP BY s.category
    ORDER BY s.category
  ''');

    return result.map(CategoryProgress.fromJson).toList();
  }

  //スタンプのカテゴリーごとの件数を取得する関数
  Future<Map<String, int>> getCategoryAchievement() async {
    final db = await database;

    final result = await db.rawQuery('''
    SELECT
      category,
      COUNT(*) as total
    FROM stamps
    GROUP BY category
  ''');

    return {
      for (final row in result) row['category'] as String: row['total'] as int,
    };
  }

  //スタンプのお気に入り状態を更新する関数
  Future<void> updateFavorite(int id, bool favorite) async {
    final db = await database;

    await db.update(
      'stamps',
      {'favorite': favorite ? 1 : 0},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  //スタンプの画像パスを更新する関数
  Future<void> updateImage(int id, String imagePath) async {
    final db = await database;

    await db.update(
      'stamps',
      {'image_path': imagePath},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  //スタンプの数を取得する関数
  Future<int> getStampCount() async {
    final db = await database;
    final result = await db.rawQuery('SELECT COUNT(*) as count FROM stamps');
    return result.first['count'] as int;
  }

  //スタンプの存在を確認する関数
  Future<void> insertTestData() async {
    final db = await database;

    await db.insert('stamps', {
      'spot_name': '善光寺',
      'url': 'https://www.zenkoji.jp',
      'comment': 'テスト登録',
      'scan_date': DateTime.now().toString(),
    });

    //debugPrint('テストデータ登録完了');
  }

  //スタンプの存在✔
  Future<bool> existsStamp(int spotId) async {
    final db = await database;

    final result = await db.query(
      'stamps',
      where: 'spot_id = ?',
      whereArgs: [spotId],
    );

    return result.isNotEmpty;
  }

  //スタンプの削除
  Future<void> deleteStamp(int id) async {
    final db = await database;

    await db.delete('stamps', where: 'id = ?', whereArgs: [id]);
  }

  //スタンプの挿入
  Future<void> insertStamp(Stamp stamp) async {
    final db = await database;

    await db.insert('stamps', stamp.toJson());
  }

  //スタンプの取得
  Future<List<Stamp>> getStamps() async {
    final db = await database;

    final result = await db.query(
      'stamps',
      orderBy: 'favorite DESC, scan_date DESC',
    );

    return result.map((e) => Stamp.fromJson(e)).toList();
  }
}
