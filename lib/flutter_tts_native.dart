
import 'flutter_tts_native_platform_interface.dart';

class FlutterTtsNative {
  Future<void> speak(String text) async {
    await FlutterTtsNativePlatform.instance.speak(text);
  }
}
