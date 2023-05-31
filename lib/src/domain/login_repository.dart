import 'result_or.dart';
import 'register_failure.dart';
import 'signin_failure.dart';
import 'email/email.dart';
import 'password/password.dart';

abstract class LoginRepository {
  Future<ResultOr<RegisterFailure>> register({
    required Email email,
    required Password password,
  });

  Future<ResultOr<SigninFailure>> signin({
    required Email email,
    required Password password,
  });
}
