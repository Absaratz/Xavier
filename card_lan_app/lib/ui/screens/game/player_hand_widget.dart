import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../state/providers/connection_provider.dart';
import '../../../state/providers/game_state_provider.dart';
import '../../widgets/cards/playing_card_widget.dart';

class PlayerHandWidget extends StatelessWidget {
  const PlayerHandWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final connection = context.watch<ConnectionProvider>();
    final state = context.watch<GameStateProvider>().state;
    if (state == null) return const SizedBox.shrink();

    final me = state.players.where((p) => p.id == connection.playerId);
    final hand = me.isEmpty ? const [] : me.first.hand;

    return SizedBox(
      height: 140,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: hand.length,
        itemBuilder: (context, index) {
          final card = hand[index];
          return PlayingCardWidget(
            card: card,
            onTap: () => connection.client.sendAction({
              'playerId': connection.playerId,
              'cardId': card.id,
              'cardRank': card.rank,
            }),
          );
        },
      ),
    );
  }
}
