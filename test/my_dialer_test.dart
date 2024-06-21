import 'package:flutter_test/flutter_test.dart';
import 'package:my_dialer/my_dialer_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockMyDialerPlatform
    with MockPlatformInterfaceMixin
    implements MyDialerPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {}
