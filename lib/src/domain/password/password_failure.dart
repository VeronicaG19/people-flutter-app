import 'package:equatable/equatable.dart';

abstract class PasswordFailure extends Equatable {
  const PasswordFailure();
  const factory PasswordFailure.tooShort(int min) = PasswordFailureTooShort;
  const factory PasswordFailure.tooLong(int max) = PasswordFailureTooLong;
  factory PasswordFailure.invalid() = PasswordFailureInvalid;

  void when({
    required void Function(PasswordFailureTooShort) tooShort,
    required void Function(PasswordFailureTooLong) tooLong,
    required void Function(PasswordFailureInvalid) invalid,
  }) {
    if (this is PasswordFailureTooShort) {
      tooShort.call(this as PasswordFailureTooShort);
    }

    if (this is PasswordFailureTooLong) {
      tooLong.call(this as PasswordFailureTooLong);
    }

    if (this is PasswordFailureInvalid) {
      invalid.call(this as PasswordFailureInvalid);
    }

    tooShort.call(this as PasswordFailureTooShort);
  }

  R map<R>({
    required R Function(PasswordFailureTooShort) tooShort,
    required R Function(PasswordFailureTooLong) tooLong,
    required R Function(PasswordFailureInvalid) invalid,
  }) {
    if (this is PasswordFailureTooShort) {
      return tooShort.call(this as PasswordFailureTooShort);
    }

    if (this is PasswordFailureTooLong) {
      return tooLong.call(this as PasswordFailureTooLong);
    }

    if (this is PasswordFailureInvalid) {
      return invalid.call(this as PasswordFailureInvalid);
    }

    return tooShort.call(this as PasswordFailureTooShort);
  }

  void maybeWhen({
    void Function(PasswordFailureTooShort)? tooShort,
    void Function(PasswordFailureTooLong)? tooLong,
    void Function(PasswordFailureInvalid)? invalid,
    required void Function() orElse,
  }) {
    if (this is PasswordFailureTooShort && tooShort != null) {
      tooShort.call(this as PasswordFailureTooShort);
    }

    if (this is PasswordFailureTooLong && tooLong != null) {
      tooLong.call(this as PasswordFailureTooLong);
    }

    if (this is PasswordFailureInvalid && invalid != null) {
      invalid.call(this as PasswordFailureInvalid);
    }

    orElse.call();
  }

  R maybeMap<R>({
    R Function(PasswordFailureTooShort)? tooShort,
    R Function(PasswordFailureTooLong)? tooLong,
    R Function(PasswordFailureInvalid)? invalid,
    required R Function() orElse,
  }) {
    if (this is PasswordFailureTooShort && tooShort != null) {
      return tooShort.call(this as PasswordFailureTooShort);
    }

    if (this is PasswordFailureTooLong && tooLong != null) {
      return tooLong.call(this as PasswordFailureTooLong);
    }

    if (this is PasswordFailureInvalid && invalid != null) {
      return invalid.call(this as PasswordFailureInvalid);
    }

    return orElse.call();
  }

  @override
  String toString() {
    if (this is PasswordFailureTooShort) {
      return 'tooShort';
    }

    if (this is PasswordFailureTooLong) {
      return 'tooLong';
    }

    if (this is PasswordFailureInvalid) {
      return 'invalid';
    }

    return 'tooShort';
  }
}

class PasswordFailureTooShort extends PasswordFailure {
  const PasswordFailureTooShort(this.min);

  final int min;

  @override
  List<Object> get props => [];
}

class PasswordFailureTooLong extends PasswordFailure {
  const PasswordFailureTooLong(this.max);

  final int max;

  @override
  List<Object> get props => [];
}

class PasswordFailureInvalid extends PasswordFailure {
  @override
  List<Object> get props => [];
}
