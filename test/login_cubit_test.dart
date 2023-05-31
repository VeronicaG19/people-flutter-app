import 'package:bloc_test/bloc_test.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:people_app/src/application/login/login_cubit.dart';
import 'package:people_app/src/domain/email/email.dart';
import 'package:people_app/src/domain/login_repository.dart';
import 'package:people_app/src/domain/password/password.dart';
import 'package:people_app/src/domain/register_failure.dart';
import 'package:people_app/src/domain/result_or.dart';

void main() {
  // Instantiate repositories and cubits later
  late final MockLoginRepository loginRepository;
  late final LoginCubit loginCubit;

  // This comment is for test purposes
  group(
    'Test LoginCubit bloc ->',
    () {
      // Setup repositories and cubits
      setUp(() {
        EquatableConfig.stringify = true;
        loginRepository = MockLoginRepository();
        loginCubit = LoginCubit(loginRepository);
      });

      blocTest<LoginCubit, LoginState>(
        'Test user sign up',
        build: () {
          when(
            () => loginRepository.register(
              email: Email('user@test.com'),
              password: Password('A1*asd'),
            ),
          ).thenAnswer(
            (invocation) async => ResultOr.failure(
              RegisterFailure.emailAlreadyInUse(),
            ),
          );

          return loginCubit;
        },
        act: (cubit) => cubit
          ..onEmailChanged('user@test.com')
          ..onPasswordChanged('A1*asd')
          ..register(),
        expect: () => [
          LoginState(
            email: Email('user@test.com'),
            password: Password(''),
            registerOrFailure: ResultOr.none(),
            signinOrFailure: ResultOr.none(),
            showError: false,
          ),
          LoginState(
            email: Email('user@test.com'),
            password: Password('A1*asd'),
            registerOrFailure: ResultOr.none(),
            signinOrFailure: ResultOr.none(),
            showError: false,
          ),
          LoginState(
            email: Email('user@test.com'),
            password: Password('A1*asd'),
            registerOrFailure: ResultOr.loading(),
            signinOrFailure: ResultOr.none(),
            showError: false,
          ),
          LoginState(
            email: Email('user@test.com'),
            password: Password('A1*asd'),
            registerOrFailure:
                ResultOr.failure(RegisterFailure.emailAlreadyInUse()),
            signinOrFailure: ResultOr.none(),
            showError: false,
          ),
          LoginState(
            email: Email('user@test.com'),
            password: Password('A1*asd'),
            registerOrFailure: ResultOr.none(),
            signinOrFailure: ResultOr.none(),
            showError: false,
          ),
        ],
      );
    },
  );
}

class MockLoginRepository extends Mock implements LoginRepository {}
