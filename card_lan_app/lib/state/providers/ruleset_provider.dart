import 'package:flutter/foundation.dart';

import '../../data/persistence/ruleset_repository.dart';
import '../../models/ruleset.dart';

/// Loaded/saved rulesets for the host lobby and the rules-builder screens.
class RulesetProvider extends ChangeNotifier {
  final RulesetRepository repository;

  List<Ruleset> rulesets = [];
  Ruleset? selected;

  RulesetProvider({RulesetRepository? repository})
      : repository = repository ?? RulesetRepository();

  Future<void> loadAll() async {
    rulesets = await repository.loadAll();
    notifyListeners();
  }

  Future<void> save(Ruleset ruleset) async {
    await repository.save(ruleset);
    await loadAll();
  }

  Future<void> delete(Ruleset ruleset) async {
    await repository.delete(ruleset.id);
    if (selected?.id == ruleset.id) selected = null;
    await loadAll();
  }

  void select(Ruleset ruleset) {
    selected = ruleset;
    notifyListeners();
  }
}
