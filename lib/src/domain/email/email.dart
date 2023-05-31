import '../value_object/value_object.dart';
import '../value_object/either.dart';
import 'email_failure.dart';

class Email extends ValueObject<EmailFailure, String> {
  @override
  final Either<EmailFailure, String> value;

  factory Email(String input) {
    return Email._(_validate(input.trim()));
  }

  const Email._(this.value);

  static Either<EmailFailure, String> _validate(String input) {
    const regex = r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$';

    if (!RegExp(regex).hasMatch(input.toString())) {
      return left(EmailFailure.invalid());
    }

    return right(input);
  }
}
