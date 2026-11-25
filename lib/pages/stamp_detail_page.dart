import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/stamp.dart';
import '../viewmodels/stamp_detail_view_model.dart';

class StampDetailPage extends StatelessWidget {
  final Stamp stamp;

  const StampDetailPage({super.key, required this.stamp});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => StampDetailViewModel(stamp),
      child: const _StampDetailView(),
    );
  }
}

class _StampDetailView extends StatelessWidget {
  const _StampDetailView();

  @override
  Widget build(BuildContext context) {
    return Consumer<StampDetailViewModel>(
      builder: (context, vm, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(vm.stamp.spotName),
            actions: [
              IconButton(
                icon: Icon(
                  vm.isFavorite ? Icons.star : Icons.star_border,
                  color: Colors.amber,
                ),
                onPressed: vm.isLoading
                    ? null
                    : () async {
                        final success = await vm.toggleFavorite();

                        if (!context.mounted) {
                          return;
                        }

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              success
                                  ? (vm.isFavorite
                                        ? 'お気に入りに追加しました'
                                        : 'お気に入りを解除しました')
                                  : '更新に失敗しました',
                            ),
                          ),
                        );
                      },
              ),
            ],
          ),
          body: Stack(
            children: [
              SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (vm.errorMessage != null)
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.only(bottom: 12),
                        color: Colors.red.shade100,
                        child: Text(vm.errorMessage!),
                      ),

                    _PhotoArea(vm),

                    const SizedBox(height: 12),

                    Wrap(
                      spacing: 8,
                      children: [
                        ElevatedButton.icon(
                          icon: const Icon(Icons.photo_library),

                          label: Text(vm.imagePath == null ? '写真追加' : '写真変更'),

                          onPressed: () async {
                            final success = await vm.pickImageFromGallery();

                            if (!context.mounted) {
                              return;
                            }

                            if (success) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('写真を保存しました')),
                              );
                            }
                          },
                        ),

                        ElevatedButton.icon(
                          icon: const Icon(Icons.camera_alt),

                          label: const Text('カメラ撮影'),

                          onPressed: () async {
                            final success = await vm.takePhoto();

                            if (!context.mounted) {
                              return;
                            }

                            if (success) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('写真を保存しました')),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    _InfoArea(vm),

                    const SizedBox(height: 24),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                        ),
                        icon: const Icon(Icons.delete),
                        label: const Text('スタンプを削除'),
                        onPressed: vm.isLoading
                            ? null
                            : () async {
                                final result = await showDialog<bool>(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Text('削除確認'),
                                    content: Text(
                                      '${vm.stamp.spotName} を削除しますか？',
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context, false);
                                        },
                                        child: const Text('キャンセル'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context, true);
                                        },
                                        child: const Text('削除'),
                                      ),
                                    ],
                                  ),
                                );

                                if (result != true) {
                                  return;
                                }

                                final deleted = await vm.deleteStamp();

                                if (deleted && context.mounted) {
                                  Navigator.pop(context, true);
                                }
                              },
                      ),
                    ),
                  ],
                ),
              ),

              if (vm.isLoading)
                Container(
                  color: Colors.black26,
                  child: const Center(child: CircularProgressIndicator()),
                ),
            ],
          ),
        );
      },
    );
  }
}

class _PhotoArea extends StatelessWidget {
  final StampDetailViewModel vm;

  const _PhotoArea(this.vm);

  @override
  Widget build(BuildContext context) {
    if (vm.imagePath == null || vm.imagePath!.isEmpty) {
      return Container(
        width: double.infinity,
        height: 220,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Center(child: Icon(Icons.photo, size: 80)),
      );
    }

    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (_) => Dialog(
            child: InteractiveViewer(child: Image.file(File(vm.imagePath!))),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.file(
          File(vm.imagePath!),
          width: double.infinity,
          height: 250,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _InfoArea extends StatelessWidget {
  final StampDetailViewModel vm;

  const _InfoArea(this.vm);

  @override
  Widget build(BuildContext context) {
    final stamp = vm.stamp;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          stamp.spotName,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 16),

        ListTile(
          leading: const Icon(Icons.category),
          title: const Text('カテゴリ'),
          subtitle: Text(stamp.category.isEmpty ? '未設定' : stamp.category),
        ),

        ListTile(
          leading: const Icon(Icons.map),
          title: const Text('都道府県'),
          subtitle: Text(stamp.prefecture.isEmpty ? '未設定' : stamp.prefecture),
        ),

        ListTile(
          leading: const Icon(Icons.comment),
          title: const Text('コメント'),
          subtitle: Text(stamp.comment.isEmpty ? 'なし' : stamp.comment),
        ),

        ListTile(
          leading: const Icon(Icons.link),
          title: const Text('URL'),
          subtitle: Text(stamp.url.isEmpty ? 'なし' : stamp.url),
        ),

        InkWell(
          onTap: () {
            final url = stamp.url;
            if (url.isNotEmpty) {
              vm.openUrl(url);
            }
          },
          child: Text(
            stamp.url,
            style: const TextStyle(
              color: Colors.blue,
              decoration: TextDecoration.underline,
            ),
          ),
        ),

        ElevatedButton.icon(
          onPressed: stamp.url.isEmpty ? null : () => vm.openUrl(stamp.url),
          icon: const Icon(Icons.open_in_new),
          label: const Text('公式サイトを見る'),
        ),

        const SizedBox(height: 20),

        ElevatedButton.icon(
          onPressed: () {
            vm.openMap(stamp.spotName);
          },
          icon: const Icon(Icons.map),
          label: const Text('Google Mapsで開く'),
        ),

        ListTile(
          leading: Icon(
            vm.isFavorite ? Icons.star : Icons.star_border,
            color: Colors.amber,
          ),
          title: const Text('お気に入り'),
          subtitle: Text(vm.isFavorite ? '登録済み' : '未登録'),
        ),
      ],
    );
  }
}
