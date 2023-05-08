import 'package:sid_d_d/src/implementation/validator_classes.dart';
import 'package:test/test.dart';
//
import 'package:sid_d_d/sid_d_d.dart';

void main() {
  group(
    'A group of tests for Validator Implemented Classes',
    () {
      setUp(() {/* Additional setup goes here. */});

      test(
        'Validator Function',
        () {
          final functionNotHitlerValidation = ValidatorFunction(
            function: (v) => v != 'Hitler',
            functionLiteral: 'bool fun(v) => v != \'Hitler\';',
          );
          final failure = Failure(
              'Failure: Fail to pass Function valitation! Value: Hitler, Type: String, Function: "bool fun(v) => v != \'Hitler\';"');
          expect(
            functionNotHitlerValidation.failures(value: 'Sid'),
            [],
          );
          expect(
            functionNotHitlerValidation.failures(value: 'Hitler'),
            [failure],
          );
        },
      );
      test(
        'Validator Positive',
        () {
          final validator = ValidatorPositive();
          expect(
            validator.failures(value: 1),
            [],
          );
          expect(
            validator.failures(value: 0),
            [],
          );
          expect(
            validator.failures(value: -1),
            [Failure('Failure: Value must be positive, Value: -1, Type: int')],
          );
        },
      );
      test(
        'Validator Negative',
        () {
          final validator = ValidatorNegative();
          expect(
            validator.failures(value: -1),
            [],
          );
          expect(
            validator.failures(value: 0),
            [Failure('Failure: Value must be negative, Value: 0, Type: int')],
          );
          expect(
            validator.failures(value: 1),
            [Failure('Failure: Value must be negative, Value: 1, Type: int')],
          );
        },
      );
      test(
        'Validator Min Value',
        () {
          final validator = ValidatorMinValue(min: 5);
          expect(
            validator.failures(value: 5),
            [],
          );
          expect(
            validator.failures(value: 6),
            [],
          );
          expect(
            validator.failures(value: 4),
            [
              Failure(
                  'Failure: Value must equal or higher than 5, Value: 4, Type: int')
            ],
          );
        },
      );
      test(
        'Validator Max Value',
        () {
          final validator = ValidatorMaxValue(max: 5);
          expect(
            validator.failures(value: 5),
            [],
          );
          expect(
            validator.failures(value: 4),
            [],
          );
          expect(
            validator.failures(value: 6),
            [
              Failure(
                  'Failure: Value must be equal or lower than 5, Value: 6, Type: int')
            ],
          );
        },
      );
      test(
        'Validator for RegExp match',
        () {
          final regExp = RegExp(r'^[a-zA-Z\s]+$');
          final validator = ValidatorRegExp(regExp: regExp);
          expect(
            validator.failures(value: 'A'),
            [],
          );
          expect(
            validator.failures(value: '1'),
            [
              Failure(
                  'Failure: Value must match $regExp, Value: 1, Type: String')
            ],
          );
        },
      );
      test(
        'Validator for Min Length',
        () {
          final validator = ValidatorMinLength(min: 2);
          expect(
            validator.failures(value: 'AAA'),
            [],
          );
          expect(
            validator.failures(value: 'AA'),
            [],
          );
          expect(
            validator.failures(value: 'A'),
            [
              Failure(
                  'Failure: Value length must be higher than 2, Value: A, Type: String')
            ],
          );
        },
      );
      test(
        'Validator for Max Length',
        () {
          final validator = ValidatorMaxLength(max: 2);
          expect(
            validator.failures(value: 'A'),
            [],
          );
          expect(
            validator.failures(value: 'AA'),
            [],
          );
          expect(
            validator.failures(value: 'AAA'),
            [
              Failure(
                  'Failure: Value length must be lower than 2, Value: AAA, Type: String')
            ],
          );
        },
      );
      test(
        'Validator for Single Line',
        () {
          final validator = ValidatorSingleLine();
          final multiLine = 'A\nA';
          expect(
            validator.failures(value: 'A'),
            [],
          );
          expect(
            validator.failures(value: multiLine),
            [
              Failure(
                  'Failure: Value must be single line, Value: ${multiLine.replaceAll(RegExp(r'\n'), '\\n')}, Type: String')
            ],
          );
        },
      );
      test(
        'Validator for Date Format',
        () {
          final validator = ValidatorDateFormat();
          expect(
            validator.failures(value: '1974-05-09 13:30:00'),
            [],
          );
          expect(
            validator.failures(value: 'A'),
            [
              Failure(
                  'Failure: Value must be in DateTime format, Value: A, Type: String')
            ],
          );
        },
      );
      test(
        'Validator for Past Date Time',
        () {
          final now = DateTime.now();
          final past = now.subtract(const Duration(days: 2));
          final future = now.add(const Duration(days: 2));
          final validator = ValidatorPastDateTime();
          expect(
            validator.failures(value: past.toString()),
            [],
          );
          expect(
            validator.failures(value: 'A'),
            [
              Failure(
                  'Failure: Value must be in DateTime format, Value: A, Type: String')
            ],
          );
          expect(
            validator.failures(value: future.toString()),
            [
              Failure(
                  'Failure: Value must be a DateTime before now, Value: $future, Type: String')
            ],
          );
        },
      );
      test(
        'Validator for Future Date Time',
        () {
          final validator = ValidatorFutureDateTime();
          expect(
            validator.failures(value: '2050-05-09 13:30:00'),
            [],
          );
          expect(
            validator.failures(value: 'A'),
            [
              Failure(
                  'Failure: Value must be in DateTime format, Value: A, Type: String')
            ],
          );
          expect(
            validator.failures(value: '1974-05-09 13:30:00'),
            [
              Failure(
                  'Failure: Value must be a DateTime after now, Value: 1974-05-09 13:30:00, Type: String')
            ],
          );
        },
      );
    },
  );
}
