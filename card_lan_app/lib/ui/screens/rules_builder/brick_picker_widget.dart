import 'package:flutter/material.dart';

import '../../../engine/builtin_bricks/brick_catalog.dart';
import '../../../models/brick_types/condition.dart';
import '../../../models/brick_types/effect.dart';
import '../../../models/brick_types/trigger.dart';

Map<String, dynamic> _defaultParams(List<ParamSpec> specs) => {
      for (final spec in specs) spec.key: spec.defaultValue,
    };

class _ConditionRow {
  String type;
  Map<String, dynamic> params;

  _ConditionRow(ConditionDef def)
      : type = def.type,
        params = _defaultParams(def.params);
}

class _EffectRow {
  String type;
  Map<String, dynamic> params;

  _EffectRow(EffectDef def)
      : type = def.type,
        params = _defaultParams(def.params);
}

/// Lets the user pick a trigger, zero or more conditions, and one or more
/// effects from [BrickCatalog], then hands the assembled selection back as
/// a new brick via [onBrickAssembled]. Purely a form over the catalog's
/// display metadata — it knows nothing about how the engine actually runs
/// a brick, only what a `type` + `params` map needs to look like.
class BrickPickerWidget extends StatefulWidget {
  final void Function(
    BrickTrigger trigger,
    List<BrickCondition> conditions,
    List<BrickEffect> effects,
  ) onBrickAssembled;

  const BrickPickerWidget({super.key, required this.onBrickAssembled});

  @override
  State<BrickPickerWidget> createState() => _BrickPickerWidgetState();
}

class _BrickPickerWidgetState extends State<BrickPickerWidget> {
  String _triggerType = BrickCatalog.triggers.first.type;
  final List<_ConditionRow> _conditionRows = [];
  List<_EffectRow> _effectRows = [_EffectRow(BrickCatalog.effects.first)];

  void _addCondition() {
    setState(() => _conditionRows.add(_ConditionRow(BrickCatalog.conditions.first)));
  }

  void _removeCondition(int index) {
    setState(() => _conditionRows.removeAt(index));
  }

  void _addEffect() {
    setState(() => _effectRows.add(_EffectRow(BrickCatalog.effects.first)));
  }

  void _removeEffect(int index) {
    if (_effectRows.length <= 1) return;
    setState(() => _effectRows.removeAt(index));
  }

  void _submit() {
    final trigger = BrickTrigger(type: _triggerType);
    final conditions = [
      for (final row in _conditionRows)
        BrickCondition(type: row.type, params: Map.of(row.params)),
    ];
    final effects = [
      for (final row in _effectRows)
        BrickEffect(type: row.type, params: Map.of(row.params)),
    ];

    widget.onBrickAssembled(trigger, conditions, effects);

    setState(() {
      _triggerType = BrickCatalog.triggers.first.type;
      _conditionRows.clear();
      _effectRows = [_EffectRow(BrickCatalog.effects.first)];
    });
  }

  Widget _buildParamField(ParamSpec spec, Map<String, dynamic> params) {
    switch (spec.kind) {
      case ParamKind.cardRank:
        return DropdownButtonFormField<String>(
          value: params[spec.key] as String? ?? spec.defaultValue as String?,
          decoration: InputDecoration(labelText: spec.label),
          items: [
            for (final rank in BrickCatalog.cardRanks)
              DropdownMenuItem(value: rank, child: Text(rank)),
          ],
          onChanged: (value) {
            if (value != null) params[spec.key] = value;
          },
        );
      case ParamKind.integer:
        return TextFormField(
          initialValue: (params[spec.key] ?? spec.defaultValue ?? 0).toString(),
          decoration: InputDecoration(labelText: spec.label),
          keyboardType: TextInputType.number,
          onChanged: (text) => params[spec.key] = int.tryParse(text) ?? params[spec.key],
        );
      case ParamKind.text:
        return TextFormField(
          initialValue: (params[spec.key] ?? spec.defaultValue ?? '').toString(),
          decoration: InputDecoration(labelText: spec.label),
          onChanged: (text) => params[spec.key] = text,
        );
    }
  }

  Widget _buildConditionRow(int index) {
    final row = _conditionRows[index];
    final def = BrickCatalog.conditionFor(row.type);

    return Card(
      key: ObjectKey(row),
      margin: const EdgeInsets.only(bottom: 8),
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: row.type,
                    items: [
                      for (final d in BrickCatalog.conditions)
                        DropdownMenuItem(value: d.type, child: Text(d.label)),
                    ],
                    onChanged: (value) {
                      if (value == null) return;
                      setState(() {
                        _conditionRows[index] = _ConditionRow(BrickCatalog.conditionFor(value));
                      });
                    },
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.delete_outline),
                  tooltip: 'Remove condition',
                  onPressed: () => _removeCondition(index),
                ),
              ],
            ),
            for (final spec in def.params) _buildParamField(spec, row.params),
          ],
        ),
      ),
    );
  }

  Widget _buildEffectRow(int index) {
    final row = _effectRows[index];
    final def = BrickCatalog.effectFor(row.type);

    return Card(
      key: ObjectKey(row),
      margin: const EdgeInsets.only(bottom: 8),
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: row.type,
                    items: [
                      for (final d in BrickCatalog.effects)
                        DropdownMenuItem(value: d.type, child: Text(d.label)),
                    ],
                    onChanged: (value) {
                      if (value == null) return;
                      setState(() {
                        _effectRows[index] = _EffectRow(BrickCatalog.effectFor(value));
                      });
                    },
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.delete_outline),
                  tooltip: 'Remove effect',
                  onPressed: _effectRows.length > 1 ? () => _removeEffect(index) : null,
                ),
              ],
            ),
            for (final spec in def.params) _buildParamField(spec, row.params),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
      margin: const EdgeInsets.all(12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('New brick', style: textTheme.titleMedium),
            const SizedBox(height: 12),
            Text('WHEN', style: textTheme.labelLarge),
            const SizedBox(height: 4),
            DropdownButtonFormField<String>(
              value: _triggerType,
              items: [
                for (final def in BrickCatalog.triggers)
                  DropdownMenuItem(value: def.type, child: Text(def.label)),
              ],
              onChanged: (value) {
                if (value != null) setState(() => _triggerType = value);
              },
            ),
            const SizedBox(height: 16),
            Text('IF (all must be true)', style: textTheme.labelLarge),
            const SizedBox(height: 4),
            for (var i = 0; i < _conditionRows.length; i++) _buildConditionRow(i),
            TextButton.icon(
              onPressed: _addCondition,
              icon: const Icon(Icons.add),
              label: const Text('Add condition'),
            ),
            const SizedBox(height: 12),
            Text('THEN', style: textTheme.labelLarge),
            const SizedBox(height: 4),
            for (var i = 0; i < _effectRows.length; i++) _buildEffectRow(i),
            TextButton.icon(
              onPressed: _addEffect,
              icon: const Icon(Icons.add),
              label: const Text('Add effect'),
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: FilledButton.icon(
                onPressed: _submit,
                icon: const Icon(Icons.check),
                label: const Text('Add brick to ruleset'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
