import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';

import '../database/database_helper.dart';
import '../screens/qr_scan_page.dart';
import 'stamp_list_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int stampCount = 0;
  static const int totalSpots = 50;
  bool hasShownCompleteDialog = false;
  late ConfettiController _confettiController;
  List<Map<String, dynamic>> categoryProgress = [];
  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(
      duration: const Duration(seconds: 5),
    );
    loadCount();
    loadCategoryProgress();
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  //データベースからカテゴリごとの進捗状況を取得して更新する関数
  Future<void> loadCategoryProgress() async {
    final result = await DatabaseHelper.instance.getCategoryProgress();

    setState(() {
      categoryProgress = result;
    });
  }

  //データベースからスタンプの件数を取得して更新する関数
  Future<void> loadCount() async {
    final count = await DatabaseHelper.instance.getStampCount();

    setState(() {
      stampCount = count;
    });

    if (count >= totalSpots && !hasShownCompleteDialog && mounted) {
      hasShownCompleteDialog = true;
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          _confettiController.play();

          return AlertDialog(
            contentPadding: const EdgeInsets.all(20),
            content: SizedBox(
              height: 300,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ConfettiWidget(
                    confettiController: _confettiController,
                    blastDirectionality: BlastDirectionality.explosive,
                    shouldLoop: false,
                    numberOfParticles: 100,
                    emissionFrequency: 0.1,
                    gravity: 0.15,
                    colors: const [
                      Colors.red,
                      Colors.blue,
                      Colors.green,
                      Colors.yellow,
                      Colors.orange,
                      Colors.purple,
                      Colors.pink,
                    ],
                  ),

                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(
                        Icons.workspace_premium,
                        color: Colors.amber,
                        size: 80,
                      ),
                      SizedBox(height: 16),
                      Text(
                        '🏆 COMPLETE!',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 12),
                      Text('全スタンプ達成！', style: TextStyle(fontSize: 18)),
                    ],
                  ),
                ],
              ),
            ),
            actions: [
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('閉じる'),
                ),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final rate = stampCount / totalSpots;

    final percent = (rate * 100).toStringAsFixed(0);

    String badge = '🔰 ビギナー';

    if (rate >= 1.0) {
      badge = '🏆 コンプリート';
    } else if (rate >= 0.75) {
      badge = '🥇 ゴールド';
    } else if (rate >= 0.5) {
      badge = '🥈 シルバー';
    } else if (rate >= 0.25) {
      badge = '🥉 ブロンズ';
    }
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(title: const Text('スタンプラリー')),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'スタンプ取得数',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Card(
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  color: rate >= 1.0 ? Colors.amber.shade100 : null,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        const Text(
                          'スタンプ達成率',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 16),

                        Text(
                          '$stampCount / $totalSpots',
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 16),

                        LinearProgressIndicator(
                          value: rate.clamp(0.0, 1.0),
                          minHeight: 12,
                          borderRadius: BorderRadius.circular(10),
                        ),

                        const SizedBox(height: 12),

                        Text(
                          '達成率 $percent%',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 16),

                        Chip(
                          backgroundColor: rate >= 1.0
                              ? Colors.amber.shade200
                              : Colors.orange.shade100,
                          avatar: Icon(
                            rate >= 1.0
                                ? Icons.workspace_premium
                                : Icons.emoji_events,
                          ),
                          label: Text(
                            badge,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.all(16),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'カテゴリ別達成率',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 16),

                        ...categoryProgress.map((row) {
                          final category = row['category'] as String;

                          final total = row['total_count'] as int;

                          final acquired = row['acquired_count'] as int;

                          final rate = total == 0 ? 0.0 : acquired / total;

                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '$category '
                                  '$acquired / $total '
                                  '(${(rate * 100).toStringAsFixed(0)}%)',
                                ),

                                const SizedBox(height: 4),

                                LinearProgressIndicator(value: rate),
                              ],
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                ElevatedButton.icon(
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const QrScanPage()),
                    );
                    loadCount();
                    loadCategoryProgress();
                  },
                  icon: const Icon(Icons.qr_code_scanner),
                  label: const Text('QRコードをスキャン'),
                ),

                const SizedBox(height: 20),

                ElevatedButton.icon(
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const StampListPage(),
                      ),
                    );
                    loadCount();
                  },
                  icon: const Icon(Icons.list),
                  label: const Text('スタンプ一覧を見る'),
                ),

                const SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () async {
                    await DatabaseHelper.instance.insertStamp(
                      spotId: 3,
                      spotName: '松本城',
                      category: '城',
                      url: 'https://www.matsumoto-castle.jp',
                      comment: '国宝の城',
                    );
                    loadCount(); // 件数更新
                  },
                  child: const Text('スタンプの登録'),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: ConfettiWidget(
            confettiController: _confettiController,
            blastDirectionality: BlastDirectionality.explosive,
            shouldLoop: false,
            numberOfParticles: 30,
            emissionFrequency: 0.05,
            gravity: 0.2,
          ),
        ),
      ],
    );
  }
}
