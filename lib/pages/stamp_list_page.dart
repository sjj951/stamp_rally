import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'stamp_detail_page.dart';
import '../viewmodels/stamp_list_view_model.dart';

class StampListPage extends StatelessWidget {
  const StampListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => StampListViewModel()..load(),
      child: const _StampListPageBody(),
    );
  }
}

class _StampListPageBody extends StatelessWidget {
  const _StampListPageBody();

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<StampListViewModel>();

    return Scaffold(
      appBar: AppBar(title: Text('スタンプ一覧 (${vm.filteredStamps.length}件)')),

      body: Column(
        children: [
          SwitchListTile(
            title: const Text('お気に入りのみ表示'),
            secondary: const Icon(Icons.star, color: Colors.amber),
            value: vm.favoriteOnly,
            onChanged: vm.setFavoriteOnly,
          ),
          if (vm.isLoadingFilter) const LinearProgressIndicator(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    isExpanded: true,
                    initialValue: vm.selectedCategory,

                    decoration: const InputDecoration(
                      labelText: 'カテゴリ',
                      border: OutlineInputBorder(),
                    ),

                    items: vm.categories
                        .map(
                          (category) => DropdownMenuItem(
                            value: category,
                            child: Text(category),
                          ),
                        )
                        .toList(),

                    onChanged: (value) async {
                      if (value != null) {
                        vm.setCategory(value);
                      }
                    },
                  ),
                ),

                const SizedBox(width: 8),

                Expanded(
                  child: DropdownButtonFormField<String>(
                    isExpanded: true,
                    initialValue: vm.selectedPrefecture,

                    decoration: const InputDecoration(
                      labelText: '都道府県',
                      border: OutlineInputBorder(),
                    ),

                    items: vm.prefectures
                        .map(
                          (prefecture) => DropdownMenuItem(
                            value: prefecture,
                            child: Text(prefecture),
                          ),
                        )
                        .toList(),

                    onChanged: (value) async {
                      if (value != null) {
                        await vm.setPrefecture(value);
                      }
                    },
                  ),
                ),
              ],
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
              onChanged: vm.setSearchText,
            ),
          ),

          Expanded(
            child: vm.filteredStamps.isEmpty
                ? const Center(child: Text('該当するスタンプがありません'))
                : ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: vm.filteredStamps.length,

                    itemBuilder: (context, index) {
                      final stamp = vm.filteredStamps[index];

                      return Card(
                        elevation: 4,
                        margin: const EdgeInsets.only(bottom: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),

                        child: ListTile(
                          leading:
                              stamp.imagePath != null &&
                                  stamp.imagePath!.isNotEmpty
                              ? GestureDetector(
                                  onTap: () {
                                    showDialog(
                                      context: context,

                                      builder: (context) => Scaffold(
                                        backgroundColor: Colors.black,

                                        appBar: AppBar(
                                          backgroundColor: Colors.black,
                                        ),

                                        body: Center(
                                          child: InteractiveViewer(
                                            child: Image.file(
                                              File(stamp.imagePath!),
                                            ),
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

                                  child: const Icon(Icons.photo),
                                ),

                          onTap: () async {
                            await Navigator.push(
                              context,

                              MaterialPageRoute(
                                builder: (_) => StampDetailPage(stamp: stamp),
                              ),
                            );

                            vm.load();
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
                                      await vm.deleteStamp(stamp.id!);

                                      if (context.mounted) {
                                        Navigator.pop(context);
                                      }
                                    },

                                    child: const Text('削除'),
                                  ),
                                ],
                              ),
                            );
                          },

                          title: Row(
                            children: [
                              if (stamp.favorite == true)
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 20,
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

                              Text(
                                'カテゴリ: ${stamp.category.isEmpty ? "未設定" : stamp.category}',
                              ),

                              Text(
                                '訪問日: ${DateFormat('yyyy/MM/dd HH:mm').format(stamp.scanDate)}',
                              ),

                              Text(
                                'コメント: ${stamp.comment}',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
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
