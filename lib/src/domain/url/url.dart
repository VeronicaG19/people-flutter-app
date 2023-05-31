import '../value_object/either.dart';
import '../value_object/value_object.dart';
import 'url_failure.dart';

class Url extends ValueObject<UrlFailure, String> {
  @override
  final Either<UrlFailure, String> value;

  factory Url(String input) {
    return Url._(
      _validate(input.trim()),
    );
  }

  const Url._(this.value);

  static Either<UrlFailure, String> _validate(String input) {
    const urlRegex =
        r'^(https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|www\.[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9]+\.[^\s]{2,}|www\.[a-zA-Z0-9]+\.[^\s]{2,})$';

    if (input.isEmpty) {
      return left(UrlFailure.empty());
    }

    if (!RegExp(urlRegex).hasMatch(input)) {
      return left(UrlFailure.invalid());
    }

    return right(input);
  }
}
