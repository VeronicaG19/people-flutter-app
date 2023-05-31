abstract class RegisterFailure {
  const RegisterFailure();
  factory RegisterFailure.unknownError() = RegisterFailureUnknownError;
  factory RegisterFailure.emailAlreadyInUse() =
      RegisterFailureEmailAlreadyInUse;
  factory RegisterFailure.invalidEmail() = RegisterFailureInvalidEmail;
  factory RegisterFailure.operationNotAllowed() =
      RegisterFailureOperationNotAllowed;
  factory RegisterFailure.weakPassword() = RegisterFailureWeakPassword;

  void when({
    required void Function(RegisterFailureUnknownError) unknownError,
    required void Function(RegisterFailureEmailAlreadyInUse) emailAlreadyInUse,
    required void Function(RegisterFailureInvalidEmail) invalidEmail,
    required void Function(RegisterFailureOperationNotAllowed)
        operationNotAllowed,
    required void Function(RegisterFailureWeakPassword) weakPassword,
  }) {
    if (this is RegisterFailureUnknownError) {
      unknownError.call(this as RegisterFailureUnknownError);
    }

    if (this is RegisterFailureEmailAlreadyInUse) {
      emailAlreadyInUse.call(this as RegisterFailureEmailAlreadyInUse);
    }

    if (this is RegisterFailureInvalidEmail) {
      invalidEmail.call(this as RegisterFailureInvalidEmail);
    }

    if (this is RegisterFailureOperationNotAllowed) {
      operationNotAllowed.call(this as RegisterFailureOperationNotAllowed);
    }

    if (this is RegisterFailureWeakPassword) {
      weakPassword.call(this as RegisterFailureWeakPassword);
    }

    unknownError.call(this as RegisterFailureUnknownError);
  }

  R map<R>({
    required R Function(RegisterFailureUnknownError) unknownError,
    required R Function(RegisterFailureEmailAlreadyInUse) emailAlreadyInUse,
    required R Function(RegisterFailureInvalidEmail) invalidEmail,
    required R Function(RegisterFailureOperationNotAllowed) operationNotAllowed,
    required R Function(RegisterFailureWeakPassword) weakPassword,
  }) {
    if (this is RegisterFailureUnknownError) {
      return unknownError.call(this as RegisterFailureUnknownError);
    }

    if (this is RegisterFailureEmailAlreadyInUse) {
      return emailAlreadyInUse.call(this as RegisterFailureEmailAlreadyInUse);
    }

    if (this is RegisterFailureInvalidEmail) {
      return invalidEmail.call(this as RegisterFailureInvalidEmail);
    }

    if (this is RegisterFailureOperationNotAllowed) {
      return operationNotAllowed
          .call(this as RegisterFailureOperationNotAllowed);
    }

    if (this is RegisterFailureWeakPassword) {
      return weakPassword.call(this as RegisterFailureWeakPassword);
    }

    return unknownError.call(this as RegisterFailureUnknownError);
  }

  void maybeWhen({
    void Function(RegisterFailureUnknownError)? unknownError,
    void Function(RegisterFailureEmailAlreadyInUse)? emailAlreadyInUse,
    void Function(RegisterFailureInvalidEmail)? invalidEmail,
    void Function(RegisterFailureOperationNotAllowed)? operationNotAllowed,
    void Function(RegisterFailureWeakPassword)? weakPassword,
    required void Function() orElse,
  }) {
    if (this is RegisterFailureUnknownError && unknownError != null) {
      unknownError.call(this as RegisterFailureUnknownError);
    }

    if (this is RegisterFailureEmailAlreadyInUse && emailAlreadyInUse != null) {
      emailAlreadyInUse.call(this as RegisterFailureEmailAlreadyInUse);
    }

    if (this is RegisterFailureInvalidEmail && invalidEmail != null) {
      invalidEmail.call(this as RegisterFailureInvalidEmail);
    }

    if (this is RegisterFailureOperationNotAllowed &&
        operationNotAllowed != null) {
      operationNotAllowed.call(this as RegisterFailureOperationNotAllowed);
    }

    if (this is RegisterFailureWeakPassword && weakPassword != null) {
      weakPassword.call(this as RegisterFailureWeakPassword);
    }

    orElse.call();
  }

  R maybeMap<R>({
    R Function(RegisterFailureUnknownError)? unknownError,
    R Function(RegisterFailureEmailAlreadyInUse)? emailAlreadyInUse,
    R Function(RegisterFailureInvalidEmail)? invalidEmail,
    R Function(RegisterFailureOperationNotAllowed)? operationNotAllowed,
    R Function(RegisterFailureWeakPassword)? weakPassword,
    required R Function() orElse,
  }) {
    if (this is RegisterFailureUnknownError && unknownError != null) {
      return unknownError.call(this as RegisterFailureUnknownError);
    }

    if (this is RegisterFailureEmailAlreadyInUse && emailAlreadyInUse != null) {
      return emailAlreadyInUse.call(this as RegisterFailureEmailAlreadyInUse);
    }

    if (this is RegisterFailureInvalidEmail && invalidEmail != null) {
      return invalidEmail.call(this as RegisterFailureInvalidEmail);
    }

    if (this is RegisterFailureOperationNotAllowed &&
        operationNotAllowed != null) {
      return operationNotAllowed
          .call(this as RegisterFailureOperationNotAllowed);
    }

    if (this is RegisterFailureWeakPassword && weakPassword != null) {
      return weakPassword.call(this as RegisterFailureWeakPassword);
    }

    return orElse.call();
  }

  factory RegisterFailure.fromString(String value) {
    if (value == 'unknownError') {
      return RegisterFailure.unknownError();
    }

    if (value == 'emailAlreadyInUse') {
      return RegisterFailure.emailAlreadyInUse();
    }

    if (value == 'invalidEmail') {
      return RegisterFailure.invalidEmail();
    }

    if (value == 'operationNotAllowed') {
      return RegisterFailure.operationNotAllowed();
    }

    if (value == 'weakPassword') {
      return RegisterFailure.weakPassword();
    }

    return RegisterFailure.unknownError();
  }

  @override
  String toString() {
    if (this is RegisterFailureUnknownError) {
      return 'unknownError';
    }

    if (this is RegisterFailureEmailAlreadyInUse) {
      return 'emailAlreadyInUse';
    }

    if (this is RegisterFailureInvalidEmail) {
      return 'invalidEmail';
    }

    if (this is RegisterFailureOperationNotAllowed) {
      return 'operationNotAllowed';
    }

    if (this is RegisterFailureWeakPassword) {
      return 'weakPassword';
    }

    return 'unknownError';
  }
}

class RegisterFailureUnknownError extends RegisterFailure {}

class RegisterFailureEmailAlreadyInUse extends RegisterFailure {}

class RegisterFailureInvalidEmail extends RegisterFailure {}

class RegisterFailureOperationNotAllowed extends RegisterFailure {}

class RegisterFailureWeakPassword extends RegisterFailure {}
