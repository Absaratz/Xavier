import '../models/ruleset.dart';
import '../network/host/game_host_server.dart';
import 'game_controller.dart';

/// Bundles a hosted match's server, controller and ruleset for the
/// lobby/host screens to start and tear down as a unit.
class GameSession {
  final GameHostServer server;
  final GameController controller;
  final Ruleset ruleset;

  GameSession({
    required this.server,
    required this.controller,
    required this.ruleset,
  });

  Future<int> start() => server.start();

  Future<void> end() => server.stop();
}
