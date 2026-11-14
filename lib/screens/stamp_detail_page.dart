import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';

import 'dart:io';

import 'package:image_picker/image_picker.dart';

import '../models/stamp.dart';
import '../repositories/stamp_repository.dart';

class StampDetailPage extends StatefulWidget {
  final Stamp stamp;

  const StampDetailPage({super.key, required this.stamp});

  @override
  State<StampDetailPage> createState() => _StampDetailPageState();
}

class _StampDetailPageState extends State<StampDetailPage> {
  final ImagePicker picker = ImagePicker();
  late String? imagePath;
  int favorite = 0;
  @override
  void initState() {
    super.initState();
    imagePath = widget.stamp.imagePath;
    favorite = widget.stamp.favorite;
  }

  //URLを開く関数追加
  Future<void> openUrl(String url) async {
    debugPrint('URL: $url');

    final uri = Uri.parse(url);

    final result = await launchUrl(uri, mode: LaunchMode.externalApplication);

    debugPrint('launch result: $result');
  }

  //Googleマップを開く関数追加
  Future<void> openMap(String placeName) async {
    final uri = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent(placeName)}',
    );

    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  //画像を選択する関数
  Future<void> pickImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image == null) return;

    //画像保存
    saveImage(image);
  }

  //カメラで写真を撮る関数
  Future<void> takePhoto() async {
    final XFile? image = await picker.pickImage(source: ImageSource.camera);

    if (image == null) return;
    //画像保存
    saveImage(image);
  }

  //画像を保存する関数
  Future<void> saveImage(XFile image) async {
    final stampId = widget.stamp.id;
    if (stampId == null) return;

    await StampRepository().updateImage(stampId, image.path);

    setState(() {
      imagePath = image.path;
    });

    if (mounted) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('写真を保存しました')));
    }
  }

  //お気に入り状態を切り替える関数
  Future<void> toggleFavorite() async {
    final stampId = widget.stamp.id;
    if (stampId == null) return;

    final newValue = favorite == 0 ? 1 : 0;

    await StampRepository().updateFavorite(stampId, newValue == 1);

    setState(() {
      favorite = newValue;
    });

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(newValue == 1 ? 'お気に入りに追加しました' : 'お気に入りを解除しました'),
        ),
      );
    }
  }

  //画像選択メニューを表示する関数
  Future<void> showImageMenu() async {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('カメラで撮影'),
                onTap: () {
                  Navigator.pop(context);
                  takePhoto();
                },
              ),

              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('ギャラリーから選択'),
                onTap: () {
                  Navigator.pop(context);
                  pickImage();
                },
              ),

              ListTile(
                leading: const Icon(Icons.close),
                title: const Text('キャンセル'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final stamp = widget.stamp;
    return Scaffold(
      appBar: AppBar(
        title: const Text('スタンプ詳細'),
        actions: [
          IconButton(
            onPressed: toggleFavorite,
            icon: Icon(
              favorite == 1 ? Icons.star : Icons.star_border,
              color: Colors.amber,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '観光地名',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),

                Text(stamp.spotName, style: const TextStyle(fontSize: 24)),

                const SizedBox(height: 20),

                ElevatedButton.icon(
                  onPressed: showImageMenu,
                  icon: const Icon(Icons.add_a_photo),
                  label: const Text('写真を追加'),
                ),

                const SizedBox(height: 12),

                if (imagePath != null && imagePath!.isNotEmpty)
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => Scaffold(
                          backgroundColor: Colors.black,
                          appBar: AppBar(
                            backgroundColor: Colors.black,
                            iconTheme: const IconThemeData(color: Colors.white),
                          ),
                          body: Center(
                            child: InteractiveViewer(
                              minScale: 0.5,
                              maxScale: 5.0,
                              child: Image.file(File(imagePath!)),
                            ),
                          ),
                        ),
                      );
                    },
                    child: Image.file(
                      File(imagePath!),
                      height: 220,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                const SizedBox(height: 20),

                const Text(
                  'URL',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),

                InkWell(
                  onTap: () {
                    final url = stamp.url;
                    if (url.isNotEmpty) {
                      openUrl(url);
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
                  onPressed: stamp.url.isEmpty
                      ? null
                      : () => openUrl(stamp.url!),
                  icon: const Icon(Icons.open_in_new),
                  label: const Text('公式サイトを見る'),
                ),
                const SizedBox(height: 20),

                ElevatedButton.icon(
                  onPressed: () {
                    openMap(stamp.spotName);
                  },
                  icon: const Icon(Icons.map),
                  label: const Text('Google Mapsで開く'),
                ),

                const SizedBox(height: 20),

                const Text('感想', style: TextStyle(fontWeight: FontWeight.bold)),

                Text(stamp.comment),

                const SizedBox(height: 20),

                const Text(
                  '取得日時',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),

                Text(
                  DateFormat('yyyy/MM/dd HH:mm')
                      .format(DateTime.parse(stamp.scanDate)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
