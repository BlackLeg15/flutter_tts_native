package com.example.flutter_tts_native

import android.speech.tts.TextToSpeech
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import java.util.*

class FlutterTtsNativePlugin: FlutterPlugin, MethodChannel.MethodCallHandler {
    private lateinit var channel: MethodChannel
    private var tts: TextToSpeech? = null

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "flutter_tts_native")
        channel.setMethodCallHandler(this)

        tts = TextToSpeech(flutterPluginBinding.applicationContext) {
            if (it == TextToSpeech.SUCCESS) {
                tts?.language = Locale.forLanguageTag("BR")
            }
        }
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        if (call.method == "speak") {
            val text = call.arguments<String>()
            tts?.speak(text, TextToSpeech.QUEUE_FLUSH, null, null)
            result.success(null)
        } else {
            result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        tts?.shutdown()
        channel.setMethodCallHandler(null)
    }
}
