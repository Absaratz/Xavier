/// Canonical [NetworkMessage.type] values shared by host and client.
class MessageTypes {
  MessageTypes._();

  // Client -> Host
  static const String joinRequest = 'join_request';
  static const String actionRequest = 'action_request';
  static const String leaveRequest = 'leave_request';

  // Host -> Client
  static const String joinAccepted = 'join_accepted';
  static const String joinRejected = 'join_rejected';
  static const String stateSync = 'state_sync';
  static const String actionRejected = 'action_rejected';
  static const String playerJoined = 'player_joined';
  static const String playerLeft = 'player_left';
}
