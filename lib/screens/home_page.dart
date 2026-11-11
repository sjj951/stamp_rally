import 'package:flutter/material.dart';

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

  @override
  void initState() {
    super.initState();
    loadCount();
  }

  Future<void> loadCount() async {
    final count = await DatabaseHelper.instance.getStampCount();

    setState(() {
      stampCount = count;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('観光地スタンプラリー')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'スタンプ取得数',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Text(
              '$stampCount個',
              style: const TextStyle(fontSize: 40, color: Colors.blue),
            ),

            const SizedBox(height: 40),

            ElevatedButton.icon(
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const QrScanPage()),
                );
                loadCount();
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
                  spotName: '松本城',
                  category: '城',
                  url: 'https://www.matsumoto-castle.jp',
                  comment: '国宝の城',
                );
                loadCount(); // 件数更新
              },
              child: const Text('テスト登録'),
            ),
          ],
        ),
      ),
    );
  }
}
