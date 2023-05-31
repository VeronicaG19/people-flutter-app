import '../value_object/either.dart';
import '../value_object/value_object.dart';
import 'surname_failure.dart';

class Surname extends ValueObject<SurnameFailure, String> {
  @override
  final Either<SurnameFailure, String> value;

  factory Surname(String input) {
    return Surname._(
      _validate(input.trim()),
    );
  }

  const Surname._(this.value);

  static Either<SurnameFailure, String> _validate(String input) {
    const regex = r'^[ña-zÑA-ZÀ-ÿ]{2,}(?: [ña-zÑA-ZÀ-ÿ]+){0,3}$';

    if (input.isEmpty) {
      return left(SurnameFailure.empty());
    }

    if (!RegExp(regex).hasMatch(input)) {
      return left(SurnameFailure.invalid());
    }
    if (input.length > maxLength) {
      return left(SurnameFailure.tooLong(maxLength));
    }

    return right(input);
  }

  static const maxLength = 40;
}
