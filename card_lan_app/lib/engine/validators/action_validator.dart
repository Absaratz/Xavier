import '../../models/game_state.dart';

/// Result of validating a client's requested action before it reaches the
/// rule engine. Keeps illegal moves (wrong turn, card not in hand, etc.)
/// out of the engine dispatch path entirely.
class ActionValidationResult {
  final bool isValid;
  final String? reason;

  const ActionValidationResult.valid()
      : isValid = true,
        reason = null;

  const ActionValidationResult.invalid(this.reason) : isValid = false;
}

class ActionValidator {
  ActionValidationResult validate({
    required GameState state,
    required Map<String, dynamic> action,
  }) {
    final playerId = action['playerId'] as String?;
    if (playerId == null) {
      return const ActionValidationResult.invalid('Missing playerId');
    }
    if (playerId != state.currentPlayerId) {
      return const ActionValidationResult.invalid('Not your turn');
    }
    return const ActionValidationResult.valid();
  }
}
