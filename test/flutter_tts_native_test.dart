import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tts_native/flutter_tts_native.dart';
import 'package:flutter_tts_native/flutter_tts_native_platform_interface.dart';
import 'package:flutter_tts_native/flutter_tts_native_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterTtsNativePlatform
    with MockPlatformInterfaceMixin
    implements FlutterTtsNativePlatform {

  @override
  Future<void> speak(String text) => Future.value();
}

void main() {
  final FlutterTtsNativePlatform initialPlatform = FlutterTtsNativePlatform.instance;

  test('$MethodChannelFlutterTtsNative is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterTtsNative>());
  });

  test('getPlatformVersion', () {
    FlutterTtsNative flutterTtsNativePlugin = FlutterTtsNative();
    MockFlutterTtsNativePlatform fakePlatform = MockFlutterTtsNativePlatform();
    FlutterTtsNativePlatform.instance = fakePlatform;

    expect(flutterTtsNativePlugin.speak('test'), completes);
  });
}
