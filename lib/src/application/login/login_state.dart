part of 'login_cubit.dart';

class LoginState {
  LoginState({
    required this.email,
    required this.password,
    required this.registerOrFailure,
    required this.signinOrFailure,
    required this.showError,
  });

  factory LoginState.initial() => LoginState(
        email: Email(''),
        password: Password(''),
        registerOrFailure: ResultOr.none(),
        signinOrFailure: ResultOr.none(),
        showError: false,
      );

  bool get isValid => email.isValid() && password.isValid();

  final Email email;
  final Password password;
  final ResultOr<RegisterFailure> registerOrFailure;
  final ResultOr<SigninFailure> signinOrFailure;
  final bool showError;

  LoginState copyWith({
    Email? email,
    Password? password,
    ResultOr<RegisterFailure>? registerOrFailure,
    ResultOr<SigninFailure>? signinOrFailure,
    bool? showError,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      registerOrFailure: registerOrFailure ?? this.registerOrFailure,
      signinOrFailure: signinOrFailure ?? this.signinOrFailure,
      showError: showError ?? this.showError,
    );
  }

  @override
  String toString() {
    return 'LoginState(email: $email, password: $password, registerOrFailure: $registerOrFailure, signinOrFailure: $signinOrFailure, showError: $showError)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoginState &&
        other.email == email &&
        other.password == password &&
        other.registerOrFailure == registerOrFailure &&
        other.signinOrFailure == signinOrFailure &&
        other.showError == showError;
  }

  @override
  int get hashCode {
    return email.hashCode ^
        password.hashCode ^
        registerOrFailure.hashCode ^
        signinOrFailure.hashCode ^
        showError.hashCode;
  }
}
