import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:people_app/src/presentation/config/const.dart';

class HomeRobot {
  HomeRobot(this.tester);

  final WidgetTester tester;

  Future<void> clickSignoutButton() async {
    final _signoutButton = find.byKey(
      const Key(PresConstants.signoutButtonKey),
    );
    await tester.ensureVisible(_signoutButton);
    await tester.tap(_signoutButton);
    await tester.pumpAndSettle();
    sleep(const Duration(seconds: 2));
  }
}
