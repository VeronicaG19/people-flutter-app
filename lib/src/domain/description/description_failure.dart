abstract class DescriptionFailure {
  const DescriptionFailure();
  factory DescriptionFailure.tooShort(int length) = DescriptionFailureTooShort;
  factory DescriptionFailure.tooLong(int length) = DescriptionFailureTooLong;

  void when({
    required void Function(DescriptionFailureTooShort) tooShort,
    required void Function(DescriptionFailureTooLong) tooLong,
  }) {
    if (this is DescriptionFailureTooShort) {
      tooShort.call(this as DescriptionFailureTooShort);
    }

    if (this is DescriptionFailureTooLong) {
      tooLong.call(this as DescriptionFailureTooLong);
    }

    tooShort.call(this as DescriptionFailureTooShort);
  }

  R map<R>({
    required R Function(DescriptionFailureTooShort) tooShort,
    required R Function(DescriptionFailureTooLong) tooLong,
  }) {
    if (this is DescriptionFailureTooShort) {
      return tooShort.call(this as DescriptionFailureTooShort);
    }

    if (this is DescriptionFailureTooLong) {
      return tooLong.call(this as DescriptionFailureTooLong);
    }

    return tooShort.call(this as DescriptionFailureTooShort);
  }

  void maybeWhen({
    void Function(DescriptionFailureTooShort)? tooShort,
    void Function(DescriptionFailureTooLong)? tooLong,
    required void Function() orElse,
  }) {
    if (this is DescriptionFailureTooShort && tooShort != null) {
      tooShort.call(this as DescriptionFailureTooShort);
    }

    if (this is DescriptionFailureTooLong && tooLong != null) {
      tooLong.call(this as DescriptionFailureTooLong);
    }

    orElse.call();
  }

  R maybeMap<R>({
    R Function(DescriptionFailureTooShort)? tooShort,
    R Function(DescriptionFailureTooLong)? tooLong,
    required R Function() orElse,
  }) {
    if (this is DescriptionFailureTooShort && tooShort != null) {
      return tooShort.call(this as DescriptionFailureTooShort);
    }

    if (this is DescriptionFailureTooLong && tooLong != null) {
      return tooLong.call(this as DescriptionFailureTooLong);
    }

    return orElse.call();
  }

  @override
  String toString() {
    if (this is DescriptionFailureTooShort) {
      return 'tooShort';
    }

    if (this is DescriptionFailureTooLong) {
      return 'tooLong';
    }

    return 'tooShort';
  }
}

class DescriptionFailureTooShort extends DescriptionFailure {
  final int length;

  DescriptionFailureTooShort(this.length);
}

class DescriptionFailureTooLong extends DescriptionFailure {
  final int length;

  DescriptionFailureTooLong(this.length);
}
