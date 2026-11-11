import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

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

    return await openDatabase(path, version: 4, onCreate: _createDB);
  }

  //データベースの作成
  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE stamps(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        spot_name TEXT NOT NULL,
        category TEXT,
        url TEXT NOT NULL,
        comment TEXT,
        image_path TEXT,
        favorite INTEGER DEFAULT 0,
        scan_date TEXT NOT NULL
      )
    ''');
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
  Future<bool> existsStamp(String spotName) async {
    final db = await database;

    final result = await db.query(
      'stamps',
      where: 'spot_name = ?',
      whereArgs: [spotName],
    );

    return result.isNotEmpty;
  }

  //スタンプの削除
  Future<void> deleteStamp(int id) async {
    final db = await database;

    await db.delete('stamps', where: 'id = ?', whereArgs: [id]);
  }

  //スタンプの挿入
  Future<void> insertStamp({
    required String spotName,
    required String category,
    required String url,
    required String comment,
    String? imagePath,
  }) async {
    final db = await database;

    await db.insert('stamps', {
      'spot_name': spotName,
      'category': category,
      'url': url,
      'comment': comment,
      'image_path': imagePath,
      'scan_date': DateTime.now().toString(),
    });
  }

  //スタンプの取得
  Future<List<Map<String, dynamic>>> getStamps() async {
    final db = await database;

    return await db.query('stamps', orderBy: 'scan_date DESC');
  }
}
