import 'dart:async';

import 'package:web_socket_channel/web_socket_channel.dart';

import '../../game/game_controller.dart';
import '../../models/network_message.dart';
import '../protocol/message_codec.dart';
import '../protocol/message_types.dart';

/// Tracks connected client sockets and routes their messages into the
/// authoritative [GameController]. Broadcasts resulting state changes back
/// to every connected client.
class HostConnectionManager {
  final GameController gameController;
  final Map<String, WebSocketChannel> _clients = {};

  HostConnectionManager({required this.gameController});

  void handleNewConnection(WebSocketChannel channel) {
    String? playerId;

    channel.stream.listen(
      (raw) => _onMessage(channel, raw as String, (id) => playerId = id),
      onDone: () {
        if (playerId != null) _onDisconnect(playerId!);
      },
    );
  }

  void _onMessage(
    WebSocketChannel channel,
    String raw,
    void Function(String playerId) bindPlayerId,
  ) {
    final message = MessageCodec.decode(raw);

    switch (message.type) {
      case MessageTypes.joinRequest:
        final playerId = gameController.registerPlayer(
          name: message.payload['name'] as String,
          channel: channel,
        );
        bindPlayerId(playerId);
        _clients[playerId] = channel;
        break;
      case MessageTypes.actionRequest:
        gameController.handleAction(message.payload);
        break;
      case MessageTypes.leaveRequest:
        final id = message.payload['playerId'] as String;
        _onDisconnect(id);
        break;
    }
  }

  void _onDisconnect(String playerId) {
    _clients.remove(playerId);
    gameController.removePlayer(playerId);
  }

  void broadcast(NetworkMessage message) {
    final raw = MessageCodec.encode(message);
    for (final channel in _clients.values) {
      channel.sink.add(raw);
    }
  }

  void sendTo(String playerId, NetworkMessage message) {
    _clients[playerId]?.sink.add(MessageCodec.encode(message));
  }
}
