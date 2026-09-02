import 'package:flutter_test/flutter_test.dart';
import 'package:card_lan_app/models/network_message.dart';
import 'package:card_lan_app/network/protocol/message_codec.dart';

void main() {
  test('MessageCodec round-trips a NetworkMessage', () {
    final message = NetworkMessage(
      type: 'action_request',
      payload: {'playerId': 'p1', 'cardId': 'card_0'},
    );

    final decoded = MessageCodec.decode(MessageCodec.encode(message));

    expect(decoded.type, message.type);
    expect(decoded.payload, message.payload);
  });
}
