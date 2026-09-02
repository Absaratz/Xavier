import 'package:flutter/material.dart';

import '../../../models/card_model.dart';
import 'playing_card_widget.dart';

/// Renders a pile (draw/discard) as a small stack showing only its top card
/// and a count badge — the pile's other cards are never sent to clients.
class CardStackWidget extends StatelessWidget {
  final List<CardModel> pile;
  final String label;

  const CardStackWidget({super.key, required this.pile, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (pile.isNotEmpty) PlayingCardWidget(card: pile.last),
        Text('$label (${pile.length})'),
      ],
    );
  }
}
