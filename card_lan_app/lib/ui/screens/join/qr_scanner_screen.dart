import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';

import '../../../network/discovery/connection_info.dart';
import '../../../state/providers/connection_provider.dart';
import '../game/game_table_screen.dart';

class QrScannerScreen extends StatefulWidget {
  const QrScannerScreen({super.key});

  @override
  State<QrScannerScreen> createState() => _QrScannerScreenState();
}

class _QrScannerScreenState extends State<QrScannerScreen> {
  bool _handled = false;

  void _onDetect(BarcodeCapture capture) {
    if (_handled) return;
    final raw = capture.barcodes.firstOrNull?.rawValue;
    if (raw == null) return;

    final info = ConnectionInfo.fromQrPayload(raw);
    if (info == null) return;

    _handled = true;
    _connect(info);
  }

  Future<void> _connect(ConnectionInfo info) async {
    final connection = context.read<ConnectionProvider>();
    await connection.connectAndJoin(info, 'Player');
    if (!mounted) return;
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const GameTableScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scan host QR code')),
      body: MobileScanner(onDetect: _onDetect),
    );
  }
}
