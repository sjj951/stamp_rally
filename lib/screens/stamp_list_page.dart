import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'dart:io';

import '../database/database_helper.dart';
import 'stamp_detail_page.dart';

class StampListPage extends StatefulWidget {
  const StampListPage({super.key});

  @override
  State<StampListPage> createState() => _StampListPageState();
}

class _StampListPageState extends State<StampListPage> {
  List<Map<String, dynamic>> stamps = [];
  List<Map<String, dynamic>> filteredStamps = [];
  @override
  void initState() {
    super.initState();
    loadStamps();
  }

  Future<void> loadStamps() async {
    final result = await DatabaseHelper.instance.getStamps();

    setState(() {
      stamps = result;
      filteredStamps = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('スタンプ一覧 (${stamps.length}件)')),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: Colors.blue.shade50,
            child: Text(
              '取得スタンプ数: ${stamps.length}件',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              decoration: const InputDecoration(
                hintText: '観光地名で検索',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  filteredStamps = stamps.where((stamp) {
                    return stamp['spot_name'].toString().toLowerCase().contains(
                      value.toLowerCase(),
                    );
                  }).toList();
                });
              },
            ),
          ),

          Expanded(
            child: filteredStamps.isEmpty
                ? const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.inbox, size: 80, color: Colors.grey),
                        SizedBox(height: 16),
                        Text(
                          '該当するスタンプがありません',
                          style: TextStyle(fontSize: 22, color: Colors.grey),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: filteredStamps.length,
                    itemBuilder: (context, index) {
                      final stamp = filteredStamps[index];

                      return Card(
                        elevation: 4,
                        margin: const EdgeInsets.only(bottom: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(8),
                          minVerticalPadding: 8,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => StampDetailPage(stamp: stamp),
                              ),
                            );
                          },
                          onLongPress: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('削除確認'),
                                content: Text('${stamp['spot_name']}を削除しますか？'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('キャンセル'),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      await DatabaseHelper.instance.deleteStamp(
                                        stamp['id'],
                                      );

                                      if (context.mounted) {
                                        Navigator.pop(context);

                                        loadStamps(); // 一覧再読込
                                      }
                                    },
                                    child: const Text('削除'),
                                  ),
                                ],
                              ),
                            );
                          },
                          leading:
                              stamp['image_path'] != null &&
                                  stamp['image_path'].toString().isNotEmpty
                              ? GestureDetector(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => Dialog(
                                        child: InteractiveViewer(
                                          child: Image.file(
                                            File(stamp['image_path']),
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.file(
                                      File(stamp['image_path']),
                                      width: 70,
                                      height: 70,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )
                              : Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    color: Colors.blue.shade100,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Icon(Icons.photo, size: 32),
                                ),
                          title: Text(
                            stamp['spot_name'],
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 6),
                              Text(
                                '訪問日: ${DateFormat('yyyy/MM/dd HH:mm').format(DateTime.parse(stamp['scan_date']))}',
                              ),
                              Text('コメント: ${stamp['comment'] ?? ''}'),
                            ],
                          ),
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
