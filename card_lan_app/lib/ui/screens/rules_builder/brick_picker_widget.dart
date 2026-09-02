import 'package:flutter/material.dart';

import '../../../models/brick_types/condition.dart';
import '../../../models/brick_types/effect.dart';
import '../../../models/brick_types/trigger.dart';

/// Lets the user pick a trigger, zero or more conditions, and one or more
/// effects from the engine's built-in registries, then hands the assembled
/// selection back as a new brick via [onBrickAssembled].
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
  // TODO: replace with dropdowns backed by the engine's condition/effect
  // registries once brick metadata (labels, param schemas) is defined.

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
