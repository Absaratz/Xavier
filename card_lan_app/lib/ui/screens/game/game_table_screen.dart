import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../state/providers/connection_provider.dart';
import '../../../state/providers/game_state_provider.dart';
import 'player_hand_widget.dart';

/// Renders the shared table (draw/discard piles, opponents) plus the local
/// player's hand. Purely a view over [GameStateProvider] — every tap sends
/// an action request through [ConnectionProvider.client] and waits for the
/// next `state_sync` to reflect it.
class GameTableScreen extends StatefulWidget {
  const GameTableScreen({super.key});

  @override
  State<GameTableScreen> createState() => _GameTableScreenState();
}

class _GameTableScreenState extends State<GameTableScreen> {
  @override
  void initState() {
    super.initState();
    final connection = context.read<ConnectionProvider>();
    final gameState = context.read<GameStateProvider>();
    connection.client.messages.listen(gameState.handleMessage);
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<GameStateProvider>().state;

    if (state == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(title: Text('Turn: ${state.currentPlayerId}')),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Text('Draw pile: ${state.drawPile.length}'),
            ),
          ),
          const PlayerHandWidget(),
        ],
      ),
    );
  }
}
