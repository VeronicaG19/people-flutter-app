abstract class SigninFailure {
  const SigninFailure();
  factory SigninFailure.unknownError() = SigninFailureUnknownError;
  factory SigninFailure.invalidEmail() = SigninFailureInvalidEmail;
  factory SigninFailure.userDisabled() = SigninFailureUserDisabled;
  factory SigninFailure.userNotFound() = SigninFailureUserNotFound;
  factory SigninFailure.wrongPassword() = SigninFailureWrongPassword;

  void when({
    required void Function(SigninFailureUnknownError) unknownError,
    required void Function(SigninFailureInvalidEmail) invalidEmail,
    required void Function(SigninFailureUserDisabled) userDisabled,
    required void Function(SigninFailureUserNotFound) userNotFound,
    required void Function(SigninFailureWrongPassword) wrongPassword,
  }) {
    if (this is SigninFailureUnknownError) {
      unknownError.call(this as SigninFailureUnknownError);
    }

    if (this is SigninFailureInvalidEmail) {
      invalidEmail.call(this as SigninFailureInvalidEmail);
    }

    if (this is SigninFailureUserDisabled) {
      userDisabled.call(this as SigninFailureUserDisabled);
    }

    if (this is SigninFailureUserNotFound) {
      userNotFound.call(this as SigninFailureUserNotFound);
    }

    if (this is SigninFailureWrongPassword) {
      wrongPassword.call(this as SigninFailureWrongPassword);
    }

    unknownError.call(this as SigninFailureUnknownError);
  }

  R map<R>({
    required R Function(SigninFailureUnknownError) unknownError,
    required R Function(SigninFailureInvalidEmail) invalidEmail,
    required R Function(SigninFailureUserDisabled) userDisabled,
    required R Function(SigninFailureUserNotFound) userNotFound,
    required R Function(SigninFailureWrongPassword) wrongPassword,
  }) {
    if (this is SigninFailureUnknownError) {
      return unknownError.call(this as SigninFailureUnknownError);
    }

    if (this is SigninFailureInvalidEmail) {
      return invalidEmail.call(this as SigninFailureInvalidEmail);
    }

    if (this is SigninFailureUserDisabled) {
      return userDisabled.call(this as SigninFailureUserDisabled);
    }

    if (this is SigninFailureUserNotFound) {
      return userNotFound.call(this as SigninFailureUserNotFound);
    }

    if (this is SigninFailureWrongPassword) {
      return wrongPassword.call(this as SigninFailureWrongPassword);
    }

    return unknownError.call(this as SigninFailureUnknownError);
  }

  void maybeWhen({
    void Function(SigninFailureUnknownError)? unknownError,
    void Function(SigninFailureInvalidEmail)? invalidEmail,
    void Function(SigninFailureUserDisabled)? userDisabled,
    void Function(SigninFailureUserNotFound)? userNotFound,
    void Function(SigninFailureWrongPassword)? wrongPassword,
    required void Function() orElse,
  }) {
    if (this is SigninFailureUnknownError && unknownError != null) {
      unknownError.call(this as SigninFailureUnknownError);
    }

    if (this is SigninFailureInvalidEmail && invalidEmail != null) {
      invalidEmail.call(this as SigninFailureInvalidEmail);
    }

    if (this is SigninFailureUserDisabled && userDisabled != null) {
      userDisabled.call(this as SigninFailureUserDisabled);
    }

    if (this is SigninFailureUserNotFound && userNotFound != null) {
      userNotFound.call(this as SigninFailureUserNotFound);
    }

    if (this is SigninFailureWrongPassword && wrongPassword != null) {
      wrongPassword.call(this as SigninFailureWrongPassword);
    }

    orElse.call();
  }

  R maybeMap<R>({
    R Function(SigninFailureUnknownError)? unknownError,
    R Function(SigninFailureInvalidEmail)? invalidEmail,
    R Function(SigninFailureUserDisabled)? userDisabled,
    R Function(SigninFailureUserNotFound)? userNotFound,
    R Function(SigninFailureWrongPassword)? wrongPassword,
    required R Function() orElse,
  }) {
    if (this is SigninFailureUnknownError && unknownError != null) {
      return unknownError.call(this as SigninFailureUnknownError);
    }

    if (this is SigninFailureInvalidEmail && invalidEmail != null) {
      return invalidEmail.call(this as SigninFailureInvalidEmail);
    }

    if (this is SigninFailureUserDisabled && userDisabled != null) {
      return userDisabled.call(this as SigninFailureUserDisabled);
    }

    if (this is SigninFailureUserNotFound && userNotFound != null) {
      return userNotFound.call(this as SigninFailureUserNotFound);
    }

    if (this is SigninFailureWrongPassword && wrongPassword != null) {
      return wrongPassword.call(this as SigninFailureWrongPassword);
    }

    return orElse.call();
  }

  factory SigninFailure.fromString(String value) {
    if (value == 'unknownError') {
      return SigninFailure.unknownError();
    }

    if (value == 'invalidEmail') {
      return SigninFailure.invalidEmail();
    }

    if (value == 'userDisabled') {
      return SigninFailure.userDisabled();
    }

    if (value == 'userNotFound') {
      return SigninFailure.userNotFound();
    }

    if (value == 'wrongPassword') {
      return SigninFailure.wrongPassword();
    }

    return SigninFailure.unknownError();
  }

  @override
  String toString() {
    if (this is SigninFailureUnknownError) {
      return 'unknownError';
    }

    if (this is SigninFailureInvalidEmail) {
      return 'invalidEmail';
    }

    if (this is SigninFailureUserDisabled) {
      return 'userDisabled';
    }

    if (this is SigninFailureUserNotFound) {
      return 'userNotFound';
    }

    if (this is SigninFailureWrongPassword) {
      return 'wrongPassword';
    }

    return 'unknownError';
  }
}

class SigninFailureUnknownError extends SigninFailure {}

class SigninFailureInvalidEmail extends SigninFailure {}

class SigninFailureUserDisabled extends SigninFailure {}

class SigninFailureUserNotFound extends SigninFailure {}

class SigninFailureWrongPassword extends SigninFailure {}
