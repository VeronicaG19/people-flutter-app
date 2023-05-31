import '../value_object/either.dart';
import '../value_object/value_object.dart';
import 'rating_failure.dart';

class Rating extends ValueObject<RatingFailure, double> {
  @override
  final Either<RatingFailure, double> value;

  factory Rating(double input) {
    return Rating._(
      _validate(input),
    );
  }

  const Rating._(this.value);

  static Either<RatingFailure, double> _validate(double input) {
    if (input < 0) {
      return left(RatingFailure.tooSmall());
    }

    if (input > 5) {
      return left(RatingFailure.tooBig());
    }

    return right(input);
  }
}
