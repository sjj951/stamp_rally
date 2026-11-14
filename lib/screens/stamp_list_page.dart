import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'dart:io';

import 'stamp_detail_page.dart';
import '../models/stamp.dart';
import '../repositories/stamp_repository.dart';

class StampListPage extends StatefulWidget {
  const StampListPage({super.key});

  @override
  State<StampListPage> createState() => _StampListPageState();
}

class _StampListPageState extends State<StampListPage> {
  List<Stamp> stamps = [];
  List<Stamp> filteredStamps = [];
  bool favoriteOnly = false;
  String searchText = '';
  String selectedCategory = 'すべて';
  final categories = ['すべて', '寺社', '城', '道の駅', '美術館', '公園'];
  @override
  void initState() {
    super.initState();
    loadStamps();
  }

  //スタンプ一覧の読み込み
  Future<void> loadStamps() async {
    final result = await StampRepository().getAll();

    setState(() {
      stamps = result;
    });

    filterStamps();
  }

  //スタンプのフィルタリング
  void filterStamps() {
    setState(() {
      filteredStamps = stamps.where((stamp) {
        final matchName = stamp.spotName.toString().toLowerCase().contains(
          searchText.toLowerCase(),
        );

        final matchFavorite = !favoriteOnly || stamp.favorite == 1;

        final matchCategory =
            selectedCategory == 'すべて' || stamp.category == selectedCategory;

        return matchName && matchFavorite && matchCategory;
      }).toList();
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
          SwitchListTile(
            title: const Text('お気に入りのみ表示'),
            value: favoriteOnly,
            onChanged: (value) {
              favoriteOnly = value;
              filterStamps();
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: DropdownButtonFormField<String>(
              initialValue: selectedCategory,
              decoration: const InputDecoration(
                labelText: 'カテゴリ',
                border: OutlineInputBorder(),
              ),
              items: categories.map((category) {
                return DropdownMenuItem(value: category, child: Text(category));
              }).toList(),
              onChanged: (value) {
                selectedCategory = value!;
                filterStamps();
              },
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
                searchText = value;
                filterStamps();
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
                            ).then((_) {
                              loadStamps();
                            });
                          },
                          onLongPress: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('削除確認'),
                                content: Text('${stamp.spotName}を削除しますか？'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('キャンセル'),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      final stampId = stamp.id;
                                      if (stampId == null) return;
                                      await StampRepository().delete(stampId);
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
                              stamp.imagePath != null &&
                                  stamp.imagePath.toString().isNotEmpty
                              ? GestureDetector(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => Dialog(
                                        child: InteractiveViewer(
                                          child: Image.file(
                                            File(stamp.imagePath!),
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.file(
                                      File(stamp.imagePath!),
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
                          title: Row(
                            children: [
                              if (stamp.favorite == 1)
                                const Padding(
                                  padding: EdgeInsets.only(right: 4),
                                  child: Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 20,
                                  ),
                                ),
                              const SizedBox(width: 4),
                              Expanded(
                                child: Text(
                                  stamp.spotName,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 6),
                              Text('カテゴリ: ${stamp.category}'),
                              Text(
                                '訪問日: ${DateFormat('yyyy/MM/dd HH:mm').format(DateTime.parse(stamp.scanDate))}',
                              ),
                              Text('コメント: ${stamp.comment}'),
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
