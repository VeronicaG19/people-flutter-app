import '../value_object/value_object.dart';
import '../value_object/either.dart';
import 'password_failure.dart';

class Password extends ValueObject<PasswordFailure, String> {
  @override
  final Either<PasswordFailure, String> value;

  factory Password(String input) {
    return Password._(_validate(input.trim()));
  }

  const Password._(this.value);

  static const minLength = 6;
  static const maxLength = 8;

  static Either<PasswordFailure, String> _validate(String input) {
    const regex =
        r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{6,8}$';

    if (input.length < minLength) {
      return left(const PasswordFailure.tooShort(minLength));
    }

    if (input.length > maxLength) {
      return left(const PasswordFailure.tooLong(maxLength));
    }

    if (!RegExp(regex).hasMatch(input.toString())) {
      return left(PasswordFailure.invalid());
    }

    return right(input);
  }
}
