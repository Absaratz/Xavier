import 'dart:async';

import 'package:web_socket_channel/web_socket_channel.dart';

import '../../models/network_message.dart';
import '../protocol/message_codec.dart';
import '../protocol/message_types.dart';
import '../discovery/connection_info.dart';

/// Thin client: connects to the host's WebSocket, sends action requests,
/// and exposes a stream of [NetworkMessage]s (state syncs, join results)
/// for the UI layer to render. Holds no game logic of its own.
class GameClient {
  WebSocketChannel? _channel;
  final _messagesController = StreamController<NetworkMessage>.broadcast();

  Stream<NetworkMessage> get messages => _messagesController.stream;

  Future<void> connect(ConnectionInfo info) async {
    _channel = WebSocketChannel.connect(info.toWebSocketUri());
    await _channel!.ready;
    _channel!.stream.listen(
      (raw) => _messagesController.add(MessageCodec.decode(raw as String)),
      onError: _messagesController.addError,
      onDone: () => _messagesController.close(),
    );
  }

  void join(String playerName) {
    _send(NetworkMessage(
      type: MessageTypes.joinRequest,
      payload: {'name': playerName},
    ));
  }

  void sendAction(Map<String, dynamic> actionPayload) {
    _send(NetworkMessage(
      type: MessageTypes.actionRequest,
      payload: actionPayload,
    ));
  }

  void _send(NetworkMessage message) {
    _channel?.sink.add(MessageCodec.encode(message));
  }

  Future<void> disconnect() async {
    await _channel?.sink.close();
    _channel = null;
  }
}
