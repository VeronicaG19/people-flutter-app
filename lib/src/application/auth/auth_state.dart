part of 'auth_cubit.dart';

class AuthState {
  AuthState({
    this.user,
  });

  factory AuthState.initial() => AuthState(
        user: null,
      );

  final User? user;

  AuthState copyWith({
    User? user,
  }) {
    return AuthState(
      user: user,
    );
  }

  @override
  String toString() => 'AuthState(user: $user)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AuthState && other.user == user;
  }

  @override
  int get hashCode => user.hashCode;
}
