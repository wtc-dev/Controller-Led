import 'dart:async';
import 'package:flutter/services.dart';
import 'dart:developer' as developer;

class LedController {
  static const MethodChannel _channel =
      const MethodChannel('led_control_channel');
// ส่งค่าไปยัง Kotlin
  static Future<void> executeCommand(String command) async {
    try {
      await _channel.invokeMethod('executeCommand', {'command': command});
    } catch (e) {
      print('Led Exception: $e');
    }
  }
}
