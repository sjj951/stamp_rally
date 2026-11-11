import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import 'dart:convert';

import '../database/database_helper.dart';

class QrScanPage extends StatefulWidget {
  const QrScanPage({super.key});

  @override
  State<QrScanPage> createState() => _QrScanPageState();
}

class _QrScanPageState extends State<QrScanPage> {
  bool scanned = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('QRスキャン')),
      body: MobileScanner(
        onDetect: (capture) async {
          if (scanned) return;

          scanned = true;

          final barcode = capture.barcodes.first;
          final code = barcode.rawValue;

          if (code == null) return;

          try {
            final data = jsonDecode(code);

            final exists = await DatabaseHelper.instance.existsStamp(
              data['spot_name'],
            );

            if (exists) {
              if (context.mounted) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('既に取得済みのスタンプです')));

                Navigator.pop(context);
              }

              return;
            }

            await DatabaseHelper.instance.insertStamp(
              spotName: data['spot_name'],
              category: data['category'],
              url: data['url'],
              comment: data['comment'],
            );

            if (context.mounted) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('スタンプ登録完了')));

              Navigator.pop(context);
            }
          } catch (e) {
            debugPrint('QR解析エラー: $e');
          }
        },
      ),
    );
  }
}
