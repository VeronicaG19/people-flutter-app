import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/login_repository.dart';
import '../../domain/email/email.dart';
import '../../domain/register_failure.dart';
import '../../domain/signin_failure.dart';
import '../../domain/password/password.dart';
import '../../domain/result_or.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginRepository) : super(LoginState.initial());

  final LoginRepository _loginRepository;

  void onEmailChanged(String email) {
    final newState = state.copyWith(
      email: Email(email),
    );

    emit(newState);
  }

  void onPasswordChanged(String password) {
    final newState = state.copyWith(
      password: Password(password),
    );

    emit(newState);
  }

  Future<void> register() async {
    if (!state.registerOrFailure.isNone) {
      return;
    }

    if (!state.isValid) {
      final errorState = state.copyWith(
        showError: true,
      );

      emit(errorState);

      return;
    }

    final loadingState = state.copyWith(
      registerOrFailure: ResultOr.loading(),
    );

    emit(loadingState);

    final registerOrFailureResponse = await _loginRepository.register(
      email: state.email,
      password: state.password,
    );

    final newState = state.copyWith(
      registerOrFailure: registerOrFailureResponse,
    );

    emit(newState);

    final cleanState = state.copyWith(
      registerOrFailure: ResultOr.none(),
    );

    emit(cleanState);
  }

  Future<void> signin() async {
    if (!state.signinOrFailure.isNone) {
      return;
    }

    if (!state.isValid) {
      final errorState = state.copyWith(
        showError: true,
      );

      emit(errorState);

      return;
    }

    final loadingState = state.copyWith(
      signinOrFailure: ResultOr.loading(),
    );

    emit(loadingState);

    final signinOrFailureResponse = await _loginRepository.signin(
      email: state.email,
      password: state.password,
    );

    final newState = state.copyWith(
      signinOrFailure: signinOrFailureResponse,
    );

    emit(newState);

    final cleanState = state.copyWith(
      signinOrFailure: ResultOr.none(),
    );

    emit(cleanState);
  }
}
