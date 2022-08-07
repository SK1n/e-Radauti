// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterapperadauti/controllers/location_controller.dart';
import 'package:flutterapperadauti/modules/notice_a_problem/screens/form/controllers/form_controller.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

bool USE_FIRESTORE_EMULATOR = false;
Future<void> main() async {
  testWidgets('Flutter form builder', (WidgetTester tester) async {
    const MethodChannel channel =
        MethodChannel('plugins.flutter.io/image_picker');

    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      ByteData data = await rootBundle.load('assets/images/code_4_romania.png');
      Uint8List bytes = data.buffer.asUint8List();
      Directory tempDir = await getTemporaryDirectory();
      File file = await File(
        '${tempDir.path}/tmp.tmp',
      ).writeAsBytes(bytes);
      print(file.path);
      return file.path;
    });
    await Firebase.initializeApp();
    Get.lazyPut(() => NoticeProblemController());
    Get.lazyPut(() => LocationController());
    debugPrint('hello');
  });
}
