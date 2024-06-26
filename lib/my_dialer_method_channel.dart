import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'my_dialer_platform_interface.dart';

/// An implementation of [MyDialerPlatform] that uses method channels.
class MethodChannelMyDialer extends MyDialerPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('my_dialer');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
