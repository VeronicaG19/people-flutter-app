import '../value_object/either.dart';
import '../value_object/value_object.dart';
import 'name_failure.dart';

class Name extends ValueObject<NameFailure, String> {
  @override
  final Either<NameFailure, String> value;

  factory Name(String input) {
    return Name._(
      _validate(input.trim()),
    );
  }

  const Name._(this.value);

  static Either<NameFailure, String> _validate(String input) {
    const nameRegex = r'^[ña-zÑA-ZÀ-ÿ]{2,}(?: [ña-zÑA-ZÀ-ÿ]+){0,3}$';

    if (input.isEmpty) {
      return left(NameFailure.empty());
    }

    if (!RegExp(nameRegex).hasMatch(input)) {
      return left(NameFailure.invalid());
    }

    if (input.length > maxLength) {
      return left(NameFailure.tooLong(maxLength));
    }

    return right(input);
  }

  static const maxLength = 30;
}
