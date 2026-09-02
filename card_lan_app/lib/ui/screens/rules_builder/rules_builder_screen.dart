import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../../../models/brick.dart';
import '../../../models/ruleset.dart';
import '../../../state/providers/ruleset_provider.dart';
import 'brick_picker_widget.dart';

/// Composes a new [Ruleset] as an ordered list of [Brick]s picked via
/// [BrickPickerWidget], then saves it through [RulesetProvider].
class RulesBuilderScreen extends StatefulWidget {
  const RulesBuilderScreen({super.key});

  @override
  State<RulesBuilderScreen> createState() => _RulesBuilderScreenState();
}

class _RulesBuilderScreenState extends State<RulesBuilderScreen> {
  final _uuid = const Uuid();
  final _nameController = TextEditingController();
  final List<Brick> _bricks = [];

  Future<void> _save() async {
    final ruleset = Ruleset(
      id: _uuid.v4(),
      name: _nameController.text,
      bricks: _bricks,
    );
    await context.read<RulesetProvider>().save(ruleset);
    if (!mounted) return;
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New ruleset'),
        actions: [IconButton(onPressed: _save, icon: const Icon(Icons.save))],
      ),
      body: Column(
        children: [
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: 'Ruleset name'),
          ),
          Expanded(
            child: ListView(
              children: [
                ..._bricks.map((b) => ListTile(title: Text(b.label))),
                BrickPickerWidget(
                  onBrickAssembled: (trigger, conditions, effects) {
                    setState(() {
                      _bricks.add(Brick(
                        id: _uuid.v4(),
                        label: '${trigger.type} -> ${effects.map((e) => e.type).join(', ')}',
                        trigger: trigger,
                        conditions: conditions,
                        effects: effects,
                      ));
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
