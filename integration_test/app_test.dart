import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:people_app/main.dart' as app;
import 'package:people_app/src/domain/email/email.dart';
import 'package:people_app/src/domain/password/password.dart';

import 'robots/home_robot.dart';
import 'robots/login_robot.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Test the whole app', (WidgetTester tester) async {
    app.main();

    final _loginRobot = LoginRobot(tester);
    final _homeRobot = HomeRobot(tester);

    await _loginRobot.findTitle();
    await _loginRobot.enterEmailText(Email('user@test.com'));
    await _loginRobot.enterPasswordText(Password('A1*asd'));
    await _loginRobot.clickSignupButton();
    await _loginRobot.clickSigninButton();

    await _homeRobot.clickSignoutButton();
  });
}
