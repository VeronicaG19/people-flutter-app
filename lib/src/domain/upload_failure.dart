abstract class UploadFailure {
  const UploadFailure();
  factory UploadFailure.unknownError() = UploadFailureUnknownError;

  void when({
    required void Function(UploadFailureUnknownError) unknownError,
  }) {
    if (this is UploadFailureUnknownError) {
      unknownError.call(this as UploadFailureUnknownError);
    }

    unknownError.call(this as UploadFailureUnknownError);
  }

  R map<R>({
    required R Function(UploadFailureUnknownError) unknownError,
  }) {
    if (this is UploadFailureUnknownError) {
      return unknownError.call(this as UploadFailureUnknownError);
    }

    return unknownError.call(this as UploadFailureUnknownError);
  }

  void maybeWhen({
    void Function(UploadFailureUnknownError)? unknownError,
    required void Function() orElse,
  }) {
    if (this is UploadFailureUnknownError && unknownError != null) {
      unknownError.call(this as UploadFailureUnknownError);
    }

    orElse.call();
  }

  R maybeMap<R>({
    R Function(UploadFailureUnknownError)? unknownError,
    required R Function() orElse,
  }) {
    if (this is UploadFailureUnknownError && unknownError != null) {
      return unknownError.call(this as UploadFailureUnknownError);
    }

    return orElse.call();
  }

  factory UploadFailure.fromString(String value) {
    if (value == 'unknownError') {
      return UploadFailure.unknownError();
    }

    return UploadFailure.unknownError();
  }

  @override
  String toString() {
    if (this is UploadFailureUnknownError) {
      return 'unknownError';
    }

    return 'unknownError';
  }
}

class UploadFailureUnknownError extends UploadFailure {}
