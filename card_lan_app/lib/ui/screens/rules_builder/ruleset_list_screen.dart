import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/ruleset.dart';
import '../../../state/providers/ruleset_provider.dart';
import 'rules_builder_screen.dart';

class RulesetListScreen extends StatefulWidget {
  const RulesetListScreen({super.key});

  @override
  State<RulesetListScreen> createState() => _RulesetListScreenState();
}

class _RulesetListScreenState extends State<RulesetListScreen> {
  @override
  void initState() {
    super.initState();
    context.read<RulesetProvider>().loadAll();
  }

  Future<void> _openBuilder({Ruleset? ruleset}) async {
    await Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => RulesBuilderScreen(initialRuleset: ruleset),
    ));
  }

  Future<void> _confirmDelete(Ruleset ruleset) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete ruleset?'),
        content: Text('"${ruleset.name}" will be permanently deleted.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
    if (confirmed == true && mounted) {
      await context.read<RulesetProvider>().delete(ruleset);
    }
  }

  @override
  Widget build(BuildContext context) {
    final rulesets = context.watch<RulesetProvider>().rulesets;

    return Scaffold(
      appBar: AppBar(title: const Text('Your rulesets')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openBuilder(),
        child: const Icon(Icons.add),
      ),
      body: rulesets.isEmpty
          ? const Center(child: Text('No rulesets yet. Tap + to build one.'))
          : ListView.builder(
              itemCount: rulesets.length,
              itemBuilder: (context, index) {
                final ruleset = rulesets[index];
                final subtitle = [
                  if (ruleset.description.isNotEmpty) ruleset.description,
                  '${ruleset.bricks.length} bricks · ${ruleset.minPlayers}-${ruleset.maxPlayers} players',
                ].join('\n');

                return ListTile(
                  title: Text(ruleset.name),
                  subtitle: Text(subtitle),
                  isThreeLine: ruleset.description.isNotEmpty,
                  onTap: () => _openBuilder(ruleset: ruleset),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete_outline),
                    tooltip: 'Delete ruleset',
                    onPressed: () => _confirmDelete(ruleset),
                  ),
                );
              },
            ),
    );
  }
}
