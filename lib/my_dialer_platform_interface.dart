import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'my_dialer_method_channel.dart';

abstract class MyDialerPlatform extends PlatformInterface {
  /// Constructs a MyDialerPlatform.
  MyDialerPlatform() : super(token: _token);

  static final Object _token = Object();

  static MyDialerPlatform _instance = MethodChannelMyDialer();

  /// The default instance of [MyDialerPlatform] to use.
  ///
  /// Defaults to [MethodChannelMyDialer].
  static MyDialerPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [MyDialerPlatform] when
  /// they register themselves.
  static set instance(MyDialerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
