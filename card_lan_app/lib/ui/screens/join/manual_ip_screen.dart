import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../network/discovery/connection_info.dart';
import '../../../state/providers/connection_provider.dart';
import '../game/game_table_screen.dart';

/// Fallback pairing path when the camera or QR scan isn't available:
/// the host's IP:port is typed in directly.
class ManualIpScreen extends StatefulWidget {
  const ManualIpScreen({super.key});

  @override
  State<ManualIpScreen> createState() => _ManualIpScreenState();
}

class _ManualIpScreenState extends State<ManualIpScreen> {
  final _hostController = TextEditingController();
  final _portController = TextEditingController(text: '51820');

  Future<void> _connect() async {
    final info = ConnectionInfo(
      host: _hostController.text.trim(),
      port: int.tryParse(_portController.text.trim()) ?? 51820,
    );
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
      appBar: AppBar(title: const Text('Enter host IP')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _hostController,
              decoration: const InputDecoration(labelText: 'Host IP'),
            ),
            TextField(
              controller: _portController,
              decoration: const InputDecoration(labelText: 'Port'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            FilledButton(onPressed: _connect, child: const Text('Connect')),
          ],
        ),
      ),
    );
  }
}
