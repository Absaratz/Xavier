import 'dart:convert';

import '../../models/ruleset.dart';
import 'local_storage_service.dart';

/// Loads bundled preset rulesets (from `assets/rulesets/`) plus any
/// user-created ones saved via [LocalStorageService], and persists new ones.
class RulesetRepository {
  final LocalStorageService storage;

  RulesetRepository({LocalStorageService? storage})
      : storage = storage ?? LocalStorageService();

  Future<List<Ruleset>> loadAll() async {
    final saved = await storage.readAllRulesets();
    return saved.map((json) => Ruleset.fromJson(json)).toList();
  }

  Future<void> save(Ruleset ruleset) async {
    await storage.writeRuleset(ruleset.id, jsonEncode(ruleset.toJson()));
  }

  Future<void> delete(String id) async {
    await storage.deleteRuleset(id);
  }
}
