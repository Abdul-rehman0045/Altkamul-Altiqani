import 'package:flutter/services.dart';

class StackExchangePlugin {
  static const MethodChannel _channel =
      const MethodChannel('stack_exchange_plugin');

  static Future<void> fetchQuestions() async {
    try {
      await _channel.invokeMethod('fetchQuestions');
    } on PlatformException catch (e) {
      print("Failed to invoke method: ${e.message}");
    }
  }
}