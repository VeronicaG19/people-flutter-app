abstract class SurnameFailure {
  const SurnameFailure();
  factory SurnameFailure.empty() = SurnameFailureEmpty;
  factory SurnameFailure.invalid() = SurnameFailureInvalid;
  factory SurnameFailure.tooLong(int length) = SurnameFailureTooLong;

  void when({
    required void Function(SurnameFailureEmpty) empty,
    required void Function(SurnameFailureInvalid) invalid,
    required void Function(SurnameFailureTooLong) tooLong,
  }) {
    if (this is SurnameFailureEmpty) {
      empty.call(this as SurnameFailureEmpty);
    }

    if (this is SurnameFailureInvalid) {
      invalid.call(this as SurnameFailureInvalid);
    }

    if (this is SurnameFailureTooLong) {
      tooLong.call(this as SurnameFailureTooLong);
    }

    empty.call(this as SurnameFailureEmpty);
  }

  R map<R>({
    required R Function(SurnameFailureEmpty) empty,
    required R Function(SurnameFailureInvalid) invalid,
    required R Function(SurnameFailureTooLong) tooLong,
  }) {
    if (this is SurnameFailureEmpty) {
      return empty.call(this as SurnameFailureEmpty);
    }

    if (this is SurnameFailureInvalid) {
      return invalid.call(this as SurnameFailureInvalid);
    }

    if (this is SurnameFailureTooLong) {
      return tooLong.call(this as SurnameFailureTooLong);
    }

    return empty.call(this as SurnameFailureEmpty);
  }

  void maybeWhen({
    void Function(SurnameFailureEmpty)? empty,
    void Function(SurnameFailureInvalid)? invalid,
    void Function(SurnameFailureTooLong)? tooLong,
    required void Function() orElse,
  }) {
    if (this is SurnameFailureEmpty && empty != null) {
      empty.call(this as SurnameFailureEmpty);
    }

    if (this is SurnameFailureInvalid && invalid != null) {
      invalid.call(this as SurnameFailureInvalid);
    }

    if (this is SurnameFailureTooLong && tooLong != null) {
      tooLong.call(this as SurnameFailureTooLong);
    }

    orElse.call();
  }

  R maybeMap<R>({
    R Function(SurnameFailureEmpty)? empty,
    R Function(SurnameFailureInvalid)? invalid,
    R Function(SurnameFailureTooLong)? tooLong,
    required R Function() orElse,
  }) {
    if (this is SurnameFailureEmpty && empty != null) {
      return empty.call(this as SurnameFailureEmpty);
    }

    if (this is SurnameFailureInvalid && invalid != null) {
      return invalid.call(this as SurnameFailureInvalid);
    }

    if (this is SurnameFailureTooLong && tooLong != null) {
      return tooLong.call(this as SurnameFailureTooLong);
    }

    return orElse.call();
  }

  factory SurnameFailure.fromString(String value) {
    if (value == 'empty') {
      return SurnameFailure.empty();
    }

    if (value == 'invalid') {
      return SurnameFailure.invalid();
    }

    return SurnameFailure.empty();
  }

  @override
  String toString() {
    if (this is SurnameFailureEmpty) {
      return 'empty';
    }

    if (this is SurnameFailureInvalid) {
      return 'invalid';
    }

    if (this is SurnameFailureTooLong) {
      return 'tooLong';
    }

    return 'empty';
  }
}

class SurnameFailureEmpty extends SurnameFailure {}

class SurnameFailureInvalid extends SurnameFailure {}

class SurnameFailureTooLong extends SurnameFailure {
  final int length;

  SurnameFailureTooLong(this.length);
}
