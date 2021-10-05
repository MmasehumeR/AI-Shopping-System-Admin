import 'package:aishop_admin/styles/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
   Widget makeTestableWidget({ Widget child}) {
    return MaterialApp(
      home: child,
    );
  }
  testWidgets('custom text ...', (tester) async {
    CustomText customText = CustomText(text: "Hello");
  });
}