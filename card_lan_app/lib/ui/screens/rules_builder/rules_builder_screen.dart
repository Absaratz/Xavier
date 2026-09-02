import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../../../engine/builtin_bricks/brick_catalog.dart';
import '../../../models/brick.dart';
import '../../../models/brick_types/condition.dart';
import '../../../models/brick_types/effect.dart';
import '../../../models/brick_types/trigger.dart';
import '../../../models/ruleset.dart';
import '../../../state/providers/ruleset_provider.dart';
import 'brick_picker_widget.dart';

String _summaryFor(
  BrickTrigger trigger,
  List<BrickCondition> conditions,
  List<BrickEffect> effects,
) {
  final triggerLabel = BrickCatalog.triggerFor(trigger.type).label;
  final effectLabel = effects.map((e) => BrickCatalog.effectFor(e.type).label).join(', ');

  if (conditions.isEmpty) {
    return '$triggerLabel → $effectLabel';
  }
  final conditionLabel =
      conditions.map((c) => BrickCatalog.conditionFor(c.type).label).join(', ');
  return '$triggerLabel, if $conditionLabel → $effectLabel';
}

String _brickSummary(Brick brick) =>
    _summaryFor(brick.trigger, brick.conditions, brick.effects);

/// Composes a [Ruleset] as an ordered list of [Brick]s picked via
/// [BrickPickerWidget], then saves it through [RulesetProvider]. Bricks run
/// in list order, so this screen lets the user reorder and remove them
/// after adding. Pass [initialRuleset] to edit an existing ruleset in
/// place (same id, so saving overwrites it) instead of creating a new one.
class RulesBuilderScreen extends StatefulWidget {
  final Ruleset? initialRuleset;

  const RulesBuilderScreen({super.key, this.initialRuleset});

  @override
  State<RulesBuilderScreen> createState() => _RulesBuilderScreenState();
}

class _RulesBuilderScreenState extends State<RulesBuilderScreen> {
  final _uuid = const Uuid();
  final _formKey = GlobalKey<FormState>();
  late final String _id = widget.initialRuleset?.id ?? _uuid.v4();
  late final _nameController =
      TextEditingController(text: widget.initialRuleset?.name ?? '');
  late final _descriptionController =
      TextEditingController(text: widget.initialRuleset?.description ?? '');
  late final _minPlayersController = TextEditingController(
      text: (widget.initialRuleset?.minPlayers ?? 2).toString());
  late final _maxPlayersController = TextEditingController(
      text: (widget.initialRuleset?.maxPlayers ?? 6).toString());
  late final List<Brick> _bricks = List.of(widget.initialRuleset?.bricks ?? []);

  bool get _isEditing => widget.initialRuleset != null;

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _minPlayersController.dispose();
    _maxPlayersController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    final minPlayers = int.parse(_minPlayersController.text);
    final maxPlayers = int.parse(_maxPlayersController.text);
    if (maxPlayers < minPlayers) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Max players must be at least min players.'),
      ));
      return;
    }

    final ruleset = Ruleset(
      id: _id,
      name: _nameController.text.trim(),
      description: _descriptionController.text.trim(),
      minPlayers: minPlayers,
      maxPlayers: maxPlayers,
      bricks: _bricks,
    );
    await context.read<RulesetProvider>().save(ruleset);
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Saved "${ruleset.name}".'),
    ));
    Navigator.of(context).pop();
  }

  String? _requiredValidator(String? value) =>
      (value == null || value.trim().isEmpty) ? 'Required' : null;

  String? _positiveIntValidator(String? value) {
    final parsed = int.tryParse(value ?? '');
    if (parsed == null || parsed < 1) return 'Enter a number ≥ 1';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isEditing ? 'Edit ruleset' : 'New ruleset'),
        actions: [
          IconButton(
            onPressed: _save,
            icon: const Icon(Icons.save),
            tooltip: 'Save ruleset',
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Ruleset name'),
              validator: _requiredValidator,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
              maxLines: 2,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _minPlayersController,
                    decoration: const InputDecoration(labelText: 'Min players'),
                    keyboardType: TextInputType.number,
                    validator: _positiveIntValidator,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextFormField(
                    controller: _maxPlayersController,
                    decoration: const InputDecoration(labelText: 'Max players'),
                    keyboardType: TextInputType.number,
                    validator: _positiveIntValidator,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Text('Bricks', style: Theme.of(context).textTheme.titleMedium),
            Text(
              'Run in this order for every matching event. Drag to reorder.',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 8),
            if (_bricks.isEmpty)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Text('No bricks yet — add one below.'),
              )
            else
              ReorderableListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _bricks.length,
                onReorder: (oldIndex, newIndex) {
                  setState(() {
                    if (newIndex > oldIndex) newIndex -= 1;
                    final brick = _bricks.removeAt(oldIndex);
                    _bricks.insert(newIndex, brick);
                  });
                },
                itemBuilder: (context, index) {
                  final brick = _bricks[index];
                  return ListTile(
                    key: ValueKey(brick.id),
                    leading: const Icon(Icons.drag_handle),
                    title: Text(_brickSummary(brick)),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete_outline),
                      tooltip: 'Remove brick',
                      onPressed: () => setState(() => _bricks.removeAt(index)),
                    ),
                  );
                },
              ),
            BrickPickerWidget(
              onBrickAssembled: (trigger, conditions, effects) {
                setState(() {
                  _bricks.add(Brick(
                    id: _uuid.v4(),
                    label: _summaryFor(trigger, conditions, effects),
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
    );
  }
}
