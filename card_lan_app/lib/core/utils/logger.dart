import 'dart:developer' as developer;

class Log {
  Log._();

  static void d(String message, {String name = 'card_lan'}) {
    developer.log(message, name: name);
  }

  static void e(String message, Object error, StackTrace stackTrace,
      {String name = 'card_lan'}) {
    developer.log(message, name: name, error: error, stackTrace: stackTrace);
  }
}
