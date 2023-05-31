import 'package:equatable/equatable.dart';

abstract class EmailFailure extends Equatable {
  const EmailFailure();
  factory EmailFailure.invalid() = EmailFailureInvalid;

  void when({
    required void Function(EmailFailureInvalid) invalid,
  }) {
    if (this is EmailFailureInvalid) {
      invalid.call(this as EmailFailureInvalid);
    }

    invalid.call(this as EmailFailureInvalid);
  }

  R map<R>({
    required R Function(EmailFailureInvalid) invalid,
  }) {
    if (this is EmailFailureInvalid) {
      return invalid.call(this as EmailFailureInvalid);
    }

    return invalid.call(this as EmailFailureInvalid);
  }

  void maybeWhen({
    void Function(EmailFailureInvalid)? invalid,
    required void Function() orElse,
  }) {
    if (this is EmailFailureInvalid && invalid != null) {
      invalid.call(this as EmailFailureInvalid);
    }

    orElse.call();
  }

  R maybeMap<R>({
    R Function(EmailFailureInvalid)? invalid,
    required R Function() orElse,
  }) {
    if (this is EmailFailureInvalid && invalid != null) {
      return invalid.call(this as EmailFailureInvalid);
    }

    return orElse.call();
  }

  factory EmailFailure.fromString(String value) {
    if (value == 'invalid') {
      return EmailFailure.invalid();
    }

    return EmailFailure.invalid();
  }

  @override
  String toString() {
    if (this is EmailFailureInvalid) {
      return 'invalid';
    }

    return 'invalid';
  }
}

class EmailFailureInvalid extends EmailFailure {
  @override
  List<Object> get props => [];
}
