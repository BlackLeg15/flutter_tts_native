import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_tts_native/flutter_tts_native.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _flutterTtsNativePlugin = FlutterTtsNative();

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> speak() {
    return _flutterTtsNativePlugin.speak('Olá, mundo!');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Plugin example app')),
        body: Center(child: ElevatedButton(onPressed: speak, child: Text('Touch to speak'))),
      ),
    );
  }
}
