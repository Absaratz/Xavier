import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

  @override
  Widget build(BuildContext context) {
    final rulesets = context.watch<RulesetProvider>().rulesets;

    return Scaffold(
      appBar: AppBar(title: const Text('Your rulesets')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => const RulesBuilderScreen()),
        ),
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: rulesets.length,
        itemBuilder: (context, index) {
          final ruleset = rulesets[index];
          return ListTile(title: Text(ruleset.name));
        },
      ),
    );
  }
}
