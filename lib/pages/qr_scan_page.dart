import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import 'dart:convert';

import '../models/stamp.dart';
import '../repositories/stamp_repository.dart';
import '../models/repository_result.dart';

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

            final result = await StampRepository().exists(data['spot_id']);
            final bool exists = result.when(
              success: (value) => value,
              failure: (_) => false,
            );
            if (exists == true) {
              if (context.mounted) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('既に取得済みのスタンプです')));
                Navigator.pop(context);
              }

              return;
            }

            await StampRepository().insert(
              Stamp(
                spotId: data['spot_id'],
                spotName: data['spot_name'],
                category: data['category'],
                url: data['url'],
                comment: data['comment'],
                scanDate: DateTime.now(),
              ),
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
