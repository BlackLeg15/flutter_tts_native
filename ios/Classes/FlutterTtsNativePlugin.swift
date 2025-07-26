import Flutter
import UIKit
import AVFoundation

public class FlutterTtsNativePlugin: NSObject, FlutterPlugin {
  let synthesizer = AVSpeechSynthesizer()

  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_tts_native", binaryMessenger: registrar.messenger())
    let instance = FlutterTtsNativePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if call.method == "speak" {
      if let args = call.arguments as? [String: Any],
         let text = args["text"] as? String {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        synthesizer.speak(utterance)
        result(nil)
      } else {
        result(FlutterError(code: "INVALID_ARGS", message: "Expected text", details: nil))
      }
    } else {
      result(FlutterMethodNotImplemented)
    }
  }
}
