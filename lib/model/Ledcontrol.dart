import 'dart:async';
import 'package:flutter/services.dart';
import 'package:test_tablet_led/model/Ledcontroller.dart';
import 'dart:developer' as developer;

class MyPlugin {
  static const MethodChannel _channel =
      const MethodChannel('led_control_channel');
//ตั้งค่าสีของ led ด้วยรหัส
  static Future<void> changeLed(String color) async {
    switch (color) {
      case 'green':
        await LedController.executeCommand(
            'echo w 0x05 > ./sys/devices/platform/led_con_h/zigbee_reset');
        break;
      case 'red':
        await LedController.executeCommand(
            'echo w 0x04 > ./sys/devices/platform/led_con_h/zigbee_reset');
        break;
      case 'blue':
        await LedController.executeCommand(
            'echo w 0x0a > ./sys/devices/platform/led_con_h/zigbee_reset');
        break;
      case 'orange':
        await LedController.executeCommand(
            'echo w 0x08 > ./sys/devices/platform/led_con_h/zigbee_reset');
        break;
      case 'yellow':
        await LedController.executeCommand(
            'echo w 0x0c > ./sys/devices/platform/led_con_h/zigbee_reset');
        break;
      case 'white':
        await LedController.executeCommand(
            'echo w 0x07 > ./sys/devices/platform/led_con_h/zigbee_reset');
        break;
    }

    print('color: $color');
  }
}
