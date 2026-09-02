import 'package:flutter/material.dart';

import '../../../models/card_model.dart';

class PlayingCardWidget extends StatelessWidget {
  final CardModel card;
  final VoidCallback? onTap;

  const PlayingCardWidget({super.key, required this.card, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 90,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          border: Border.all(color: Theme.of(context).colorScheme.outline),
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        child: Text(
          '${card.rank}\n${card.suit.name}',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
