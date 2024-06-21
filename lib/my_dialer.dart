import 'dart:async';

import 'package:flutter/services.dart';

class MyDialer {
  static const MethodChannel _channel = MethodChannel('my_dialer');

  static Future<void> callNumber(String number) async {
    await _channel.invokeMethod('callNumber', {'number': number});
  }
}
