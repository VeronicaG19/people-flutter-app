import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:people_app/src/domain/email/email.dart';
import 'package:people_app/src/domain/password/password.dart';

import 'package:people_app/src/presentation/l10n/generated/l10n.dart';
import 'package:people_app/src/presentation/config/const.dart';

class LoginRobot {
  LoginRobot(this.tester);

  final WidgetTester tester;

  Future<void> findTitle() async {
    await tester.pumpAndSettle();
    final _loginTextFinder = find.text(S.current.login);
    expect(_loginTextFinder, findsOneWidget);
    sleep(const Duration(seconds: 2));
  }

  Future<void> enterEmailText(Email email) async {
    await tester.pumpAndSettle();
    final _emailInputFinder =
        find.byKey(const Key(PresConstants.emailInputKey));
    await tester.enterText(_emailInputFinder, email.getOrCrash());
    sleep(const Duration(seconds: 1));
  }

  Future<void> enterPasswordText(Password password) async {
    await tester.pumpAndSettle();
    final _passwordInputFinder =
        find.byKey(const Key(PresConstants.passwordInputKey));
    await tester.enterText(_passwordInputFinder, password.getOrCrash());
    sleep(const Duration(seconds: 1));
  }

  Future<void> clickSignupButton() async {
    final _signupButton = find.byKey(const Key(PresConstants.signupButtonKey));
    await tester.ensureVisible(_signupButton);
    await tester.tap(_signupButton);
    await tester.pumpAndSettle();
    sleep(const Duration(seconds: 3));
  }

  Future<void> clickSigninButton() async {
    final _signinButton = find.byKey(const Key(PresConstants.signinButtonKey));
    await tester.ensureVisible(_signinButton);
    await tester.tap(_signinButton);
    await tester.pumpAndSettle();
    sleep(const Duration(seconds: 3));
  }
}
