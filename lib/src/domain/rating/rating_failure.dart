abstract class RatingFailure {
  const RatingFailure();
  factory RatingFailure.tooSmall() = RatingFailureTooSmall;
  factory RatingFailure.tooBig() = RatingFailureTooBig;

  void when({
    required void Function(RatingFailureTooSmall) tooSmall,
    required void Function(RatingFailureTooBig) tooBig,
  }) {
    if (this is RatingFailureTooSmall) {
      tooSmall.call(this as RatingFailureTooSmall);
    }

    if (this is RatingFailureTooBig) {
      tooBig.call(this as RatingFailureTooBig);
    }

    tooSmall.call(this as RatingFailureTooSmall);
  }

  R map<R>({
    required R Function(RatingFailureTooSmall) tooSmall,
    required R Function(RatingFailureTooBig) tooBig,
  }) {
    if (this is RatingFailureTooSmall) {
      return tooSmall.call(this as RatingFailureTooSmall);
    }

    if (this is RatingFailureTooBig) {
      return tooBig.call(this as RatingFailureTooBig);
    }

    return tooSmall.call(this as RatingFailureTooSmall);
  }

  void maybeWhen({
    void Function(RatingFailureTooSmall)? tooSmall,
    void Function(RatingFailureTooBig)? tooBig,
    required void Function() orElse,
  }) {
    if (this is RatingFailureTooSmall && tooSmall != null) {
      tooSmall.call(this as RatingFailureTooSmall);
    }

    if (this is RatingFailureTooBig && tooBig != null) {
      tooBig.call(this as RatingFailureTooBig);
    }

    orElse.call();
  }

  R maybeMap<R>({
    R Function(RatingFailureTooSmall)? tooSmall,
    R Function(RatingFailureTooBig)? tooBig,
    required R Function() orElse,
  }) {
    if (this is RatingFailureTooSmall && tooSmall != null) {
      return tooSmall.call(this as RatingFailureTooSmall);
    }

    if (this is RatingFailureTooBig && tooBig != null) {
      return tooBig.call(this as RatingFailureTooBig);
    }

    return orElse.call();
  }

  factory RatingFailure.fromString(String value) {
    if (value == 'tooSmall') {
      return RatingFailure.tooSmall();
    }

    if (value == 'tooBig') {
      return RatingFailure.tooBig();
    }

    return RatingFailure.tooSmall();
  }

  @override
  String toString() {
    if (this is RatingFailureTooSmall) {
      return 'tooSmall';
    }

    if (this is RatingFailureTooBig) {
      return 'tooBig';
    }

    return 'tooSmall';
  }
}

class RatingFailureTooSmall extends RatingFailure {}

class RatingFailureTooBig extends RatingFailure {}
