abstract class DownloadFailure {
  const DownloadFailure();
  factory DownloadFailure.unknownError() = DownloadFailureUnknownError;

  void when({
    required void Function(DownloadFailureUnknownError) unknownError,
  }) {
    if (this is DownloadFailureUnknownError) {
      unknownError.call(this as DownloadFailureUnknownError);
    }

    unknownError.call(this as DownloadFailureUnknownError);
  }

  R map<R>({
    required R Function(DownloadFailureUnknownError) unknownError,
  }) {
    if (this is DownloadFailureUnknownError) {
      return unknownError.call(this as DownloadFailureUnknownError);
    }

    return unknownError.call(this as DownloadFailureUnknownError);
  }

  void maybeWhen({
    void Function(DownloadFailureUnknownError)? unknownError,
    required void Function() orElse,
  }) {
    if (this is DownloadFailureUnknownError && unknownError != null) {
      unknownError.call(this as DownloadFailureUnknownError);
    }

    orElse.call();
  }

  R maybeMap<R>({
    R Function(DownloadFailureUnknownError)? unknownError,
    required R Function() orElse,
  }) {
    if (this is DownloadFailureUnknownError && unknownError != null) {
      return unknownError.call(this as DownloadFailureUnknownError);
    }

    return orElse.call();
  }

  factory DownloadFailure.fromString(String value) {
    if (value == 'unknownError') {
      return DownloadFailure.unknownError();
    }

    return DownloadFailure.unknownError();
  }

  @override
  String toString() {
    if (this is DownloadFailureUnknownError) {
      return 'unknownError';
    }

    return 'unknownError';
  }
}

class DownloadFailureUnknownError extends DownloadFailure {}
