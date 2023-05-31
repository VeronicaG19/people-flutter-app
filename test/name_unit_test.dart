import 'package:flutter_test/flutter_test.dart';
import 'package:people_app/src/domain/name/name.dart';
import 'package:people_app/src/domain/name/name_failure.dart';
import 'package:people_app/src/domain/value_object/either.dart';

void main() {
  group('Test Name value object ->', () {
    test('Value should be right', () {
      final _name = Name('Alex Ramírez Delgado');

      expect(
        _name.value,
        Either<NameFailure, String>(left: null, right: 'Alex Ramírez Delgado'),
      );
    });

    test('Value should be valid', () {
      final _name = Name('Alex Ramírez Delgado');

      expect(
        _name.isValid(),
        true,
      );
    });

    test('Value should be left (invalid)', () {
      final _name = Name('Alex123 Ramírez Delgado');

      expect(
        _name.value,
        Either<NameFailure, String>(left: NameFailure.invalid(), right: null),
      );
    });

    test('Value should be invalid', () {
      final _name = Name('Alex123 Ramírez Delgado');

      expect(
        _name.isValid(),
        false,
      );
    });

    test('Value should be left (empty)', () {
      final _name = Name('');

      expect(
        _name.value,
        Either<NameFailure, String>(left: NameFailure.empty(), right: null),
      );
    });

    test('Value should be left (too long)', () {
      final _name = Name('Alex Garroguerrikaetxebarria Delgado');

      expect(
        _name.value,
        Either<NameFailure, String>(left: NameFailure.tooLong(30), right: null),
      );
    });
  });
}
