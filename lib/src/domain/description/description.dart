import '../value_object/either.dart';
import '../value_object/value_object.dart';
import 'description_failure.dart';

class Description extends ValueObject<DescriptionFailure, String> {
  @override
  final Either<DescriptionFailure, String> value;

  factory Description(String input) {
    return Description._(
      _validate(input.trim()),
    );
  }

  const Description._(this.value);

  static Either<DescriptionFailure, String> _validate(String input) {
    if (input.length < minLength) {
      return left(DescriptionFailure.tooShort(minLength));
    }

    if (input.length > maxLength) {
      return left(DescriptionFailure.tooLong(maxLength));
    }

    return right(input);
  }

  static const minLength = 10;
  static const maxLength = 50;
}
