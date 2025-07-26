import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_tts_native_method_channel.dart';

abstract class FlutterTtsNativePlatform extends PlatformInterface {
  /// Constructs a FlutterTtsNativePlatform.
  FlutterTtsNativePlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterTtsNativePlatform _instance = MethodChannelFlutterTtsNative();

  /// The default instance of [FlutterTtsNativePlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterTtsNative].
  static FlutterTtsNativePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterTtsNativePlatform] when
  /// they register themselves.
  static set instance(FlutterTtsNativePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> speak(String text) async {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
