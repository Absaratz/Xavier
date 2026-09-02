import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../state/providers/ruleset_provider.dart';
import 'qr_display_screen.dart';

/// Lets the host pick a ruleset and starts the embedded server once
/// confirmed, then hands off to [QrDisplayScreen] for pairing.
class HostLobbyScreen extends StatefulWidget {
  const HostLobbyScreen({super.key});

  @override
  State<HostLobbyScreen> createState() => _HostLobbyScreenState();
}

class _HostLobbyScreenState extends State<HostLobbyScreen> {
  @override
  void initState() {
    super.initState();
    context.read<RulesetProvider>().loadAll();
  }

  @override
  Widget build(BuildContext context) {
    final rulesets = context.watch<RulesetProvider>().rulesets;

    return Scaffold(
      appBar: AppBar(title: const Text('Host a game')),
      body: ListView.builder(
        itemCount: rulesets.length,
        itemBuilder: (context, index) {
          final ruleset = rulesets[index];
          return ListTile(
            title: Text(ruleset.name),
            subtitle: Text(ruleset.description),
            onTap: () {
              context.read<RulesetProvider>().select(ruleset);
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const QrDisplayScreen()),
              );
            },
          );
        },
      ),
    );
  }
}
