import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../host/host_lobby_screen.dart';
import '../join/join_screen.dart';
import '../rules_builder/ruleset_list_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppConstants.appName)),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FilledButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const HostLobbyScreen()),
              ),
              child: const Text('Host a game'),
            ),
            const SizedBox(height: 16),
            OutlinedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const JoinScreen()),
              ),
              child: const Text('Join a game'),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const RulesetListScreen()),
              ),
              child: const Text('Manage rulesets'),
            ),
          ],
        ),
      ),
    );
  }
}
