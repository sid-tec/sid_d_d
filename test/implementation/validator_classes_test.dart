import 'package:sid_d_d/src/implementation/validator_classes.dart';
import 'package:test/test.dart';
//
import 'package:sid_d_d/sid_d_d.dart';

void main() {
  group(
    'A group of tests for Validator Implemented Classes',
    () {
      setUp(() {/* Additional setup goes here. */});
      // Function
      test(
        'Validator Function',
        () {
          final functionNotHitlerValidation = ValidatorFunction(
            function: (v) => v != 'Hitler',
            functionLiteral: 'bool fun(v) => v != \'Hitler\';',
          );
          final failure = Failure(
              'Fail to pass Function valitation! Value: Hitler, Type: String, Function: "bool fun(v) => v != \'Hitler\';"');
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
      // Positive
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
            [Failure('Value must be positive! Value: -1, Type: int')],
          );
        },
      );
      // Negative
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
            [Failure('Value must be negative! Value: 0, Type: int')],
          );
          expect(
            validator.failures(value: 1),
            [Failure('Value must be negative! Value: 1, Type: int')],
          );
        },
      );
      // Min Value
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
                  'Value must be equal or higher than 5! Value: 4, Type: int')
            ],
          );
        },
      );
      // Max Value
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
                  'Value must be equal or lower than 5! Value: 6, Type: int')
            ],
          );
        },
      );
      // RegExp
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
            [Failure('Value must match "$regExp"! Value: 1, Type: String')],
          );
        },
      );
      // Min Length
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
                  'Value length must be higher than 2! Value: A, Type: String')
            ],
          );
        },
      );
      // Max Length
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
                  'Value length must be lower than 2! Value: AAA, Type: String')
            ],
          );
        },
      );
      // Not Empty
      test(
        'Validator for Not Empty',
        () {
          final validator = ValidatorNotEmpty();
          final empty = '';
          final notEmpty = 'A';

          expect(
            validator.failures(value: notEmpty),
            [],
          );
          expect(
            validator.failures(value: empty),
            [Failure('Value must NOT be empty! Value: "", Type: String')],
          );
        },
      );
      // Single Line
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
                  'Value must be single line! Value: ${multiLine.replaceAll(RegExp(r'\n'), '\\n')}, Type: String')
            ],
          );
        },
      );
      // One Word
      test(
        'Validator for One Word',
        () {
          final validator = ValidatorOneWord();
          final oneWord = 'A';
          final poliWord = 'A A';
          expect(
            validator.failures(value: oneWord),
            [],
          );
          expect(
            validator.failures(value: poliWord),
            [
              Failure(
                'Value must be only one word, without spaces! Value: "$poliWord", Type: String')
            ],
          );
        },
      );
      // Poli Word
      test(
        'Validator for Poli Words',
        () {
          final validator = ValidatorPoliWords();
          final oneWord = 'A';
          final poliWord = 'A A';
          expect(
            validator.failures(value: poliWord),
            [],
          );
          expect(
            validator.failures(value: oneWord),
            [
              Failure(
                'Value must be more than one word, with space! Value: "$oneWord", Type: String')
            ],
          );
        },
      );
      // Date Format
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
                  'Value must be in DateTime format! Value: A, Type: String')
            ],
          );
        },
      );
      // Past Date
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
                  'Value must be in DateTime format! Value: A, Type: String')
            ],
          );
          expect(
            validator.failures(value: future.toString()),
            [
              Failure(
                  'Value must be a DateTime before now! Value: $future, Type: String')
            ],
          );
        },
      );
      // Future Date
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
                  'Value must be in DateTime format! Value: A, Type: String')
            ],
          );
          expect(
            validator.failures(value: '1974-05-09 13:30:00'),
            [
              Failure(
                  'Value must be a DateTime after now! Value: 1974-05-09 13:30:00, Type: String')
            ],
          );
        },
      );
    },
  );



}
