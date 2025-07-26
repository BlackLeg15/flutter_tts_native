import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_tts_native_platform_interface.dart';

/// An implementation of [FlutterTtsNativePlatform] that uses method channels.
class MethodChannelFlutterTtsNative extends FlutterTtsNativePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_tts_native');

  @override
  Future<void> speak(String text) async {
    await methodChannel.invokeMethod('speak', text);
  }
}
