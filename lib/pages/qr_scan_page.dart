import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import 'dart:convert';

import 'package:provider/provider.dart';

import '../models/stamp.dart';
import '../viewmodels/qr_scan_view_model.dart';

class QrScanPage extends StatelessWidget {
  const QrScanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => QrScanViewModel(),
      child: const _QrScanPageBody(),
    );
  }
}

class _QrScanPageBody extends StatefulWidget {
  const _QrScanPageBody();

  @override
  State<_QrScanPageBody> createState() => _QrScanPageBodyState();
}

class _QrScanPageBodyState extends State<_QrScanPageBody> {
  bool scanned = false;

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<QrScanViewModel>();
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
            final bool exists = await vm.exists(data['spot_id']);
            if (exists == true) {
              if (context.mounted) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('既に取得済みのスタンプです')));
                Navigator.pop(context);
              }

              return;
            }

            vm.saveStamp(
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
