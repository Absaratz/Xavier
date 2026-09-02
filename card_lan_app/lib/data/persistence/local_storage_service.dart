import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

/// Persists user-created rulesets as JSON files under the app's documents
/// directory. Works identically on Android and iOS via `path_provider`.
class LocalStorageService {
  Future<Directory> _rulesetsDir() async {
    final base = await getApplicationDocumentsDirectory();
    final dir = Directory('${base.path}/rulesets');
    if (!await dir.exists()) {
      await dir.create(recursive: true);
    }
    return dir;
  }

  Future<void> writeRuleset(String id, String json) async {
    final dir = await _rulesetsDir();
    await File('${dir.path}/$id.json').writeAsString(json);
  }

  Future<void> deleteRuleset(String id) async {
    final dir = await _rulesetsDir();
    final file = File('${dir.path}/$id.json');
    if (await file.exists()) {
      await file.delete();
    }
  }

  Future<List<Map<String, dynamic>>> readAllRulesets() async {
    final dir = await _rulesetsDir();
    final files = dir.listSync().whereType<File>();
    final results = <Map<String, dynamic>>[];
    for (final file in files) {
      final content = await file.readAsString();
      results.add(jsonDecode(content) as Map<String, dynamic>);
    }
    return results;
  }
}
