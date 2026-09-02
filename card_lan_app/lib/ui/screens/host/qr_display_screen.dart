import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../network/discovery/connection_info.dart';
import '../../../network/discovery/qr_pairing.dart';

/// Starts the host server, resolves the LAN IP, and shows it as a QR code
/// for other phones to scan. Manual-IP fallback is just [connectionInfo]
/// printed as text underneath.
class QrDisplayScreen extends StatefulWidget {
  const QrDisplayScreen({super.key});

  @override
  State<QrDisplayScreen> createState() => _QrDisplayScreenState();
}

class _QrDisplayScreenState extends State<QrDisplayScreen> {
  final QrPairing _pairing = QrPairing();
  ConnectionInfo? _connectionInfo;

  @override
  void initState() {
    super.initState();
    _resolveConnectionInfo();
  }

  Future<void> _resolveConnectionInfo() async {
    // TODO: start GameHostServer, then use its bound port here.
    final info = await _pairing.buildHostConnectionInfo(51820);
    setState(() => _connectionInfo = info);
  }

  @override
  Widget build(BuildContext context) {
    final info = _connectionInfo;

    return Scaffold(
      appBar: AppBar(title: const Text('Waiting for players')),
      body: Center(
        child: info == null
            ? const CircularProgressIndicator()
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  QrImageView(data: info.toQrPayload(), size: 220),
                  const SizedBox(height: 16),
                  Text('${info.host}:${info.port}'),
                ],
              ),
      ),
    );
  }
}
