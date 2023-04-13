/* import 'package:test/test.dart';


// #############################################################################
// #  Ver:
// #  Nullsafety
// #  TODO: Comment class
// #
// #
// #############################################################################
void main() {
  group('Is Value Valid Classes Test', () {
    setUp(() {
      // Additional setup goes here.
    });
    //
    test('Not Empty String Test', () {
      var validation = IsValidNotEmpty();
      //
      expect(
        validation.isValid(''),
        false,
      );
      expect(
        validation.isValid('1'),
        true,
      );
    });
    //
    test('Single Line String Test', () {
      var validation = IsValidSingleLine();
      //
      expect(
        validation.isValid('12'),
        true,
      );
      expect(
        validation.isValid('1\n2'),
        false,
      );
    });
    //
    test('Min Length String Test', () {
      var validation = IsValidMinLength(minLength: 2);
      expect(
        validation.isValid('1'),
        false,
      );
      expect(
        validation.isValid('12'),
        true,
      );
      expect(
        validation.isValid('123'),
        true,
      );
    });
    //
    test('MaxLength String Test', () {
      var validation = IsValidMaxLength(maxLength: 2);
      //
      expect(
        validation.isValid('1'),
        true,
      );
      expect(
        validation.isValid('12'),
        true,
      );
      expect(
        validation.isValid('123'),
        false,
      );
    });
    //
    test('Date Time String Test', () {
      var validation = IsValidDateFormat();
      //
      expect(
        validation.isValid('sid'),
        false,
      );
      expect(
        validation.isValid('2022-01-09 16:37:07'),
        true,
      );
    });

    test('Regular Expression String Test', () {
      var reg = RegExp(r'^[a-zA-Z0-9\s]+$');
      var validation = IsValidRegExp(regExp: reg);
      //
      expect(
        validation.isValid('abc123%'),
        false,
      );
      expect(
        validation.isValid('abc123'),
        true,
      );
      expect(
        validation.isValid('abc 123'),
        true,
      );
    });
    //
    test('Other Validatiion String Test', () {
      bool equalsToSid(v) => v == 'Sid';
      var validation = IsValidFunction(function: equalsToSid);
      //
      expect(
        validation.isValid('Sid%'),
        false,
      );
      expect(
        validation.isValid('Sid'),
        true,
      );
    });
    //
    test(' Test if is positive', () {
      var validation = IsValidPositive();
      //
      expect(validation.isValid(1), true);
      expect(validation.isValid(0), true);
      expect(validation.isValid(-1), false);
    });
    //
    test(' Test if is Negative', () {
      var validation = IsValidNegative();
      //
      expect(validation.isValid(-1), true);
      expect(validation.isValid(0), false);
      expect(validation.isValid(1), false);
    });
    //
    test('Min  Test', () {
      var validation = IsValidMinValue(minValue: 2);
      //
      expect(validation.isValid(3), true);
      expect(validation.isValid(2), true);
      expect(validation.isValid(1), false);
    });
    //
    test('Max  Test', () {
      var validation = IsValidMaxValue(maxValue: 2);
      //
      expect(validation.isValid(1), true);
      expect(validation.isValid(2), true);
      expect(validation.isValid(3), false);
    });
  });
  //
}
// ******************************************************************
// *    _____   _   _____      _______   ______    _____   _    _
// *   / ____| | | |  __ \    |__   __| |  ____|  / ____| | |  | |
// *  | (___   | | | |  | |      | |    | |__    | |      | |__| |
// *   \___ \  | | | |  | |      | |    |  __|   | |      |  __  |
// *   ____) | |_| | |__| |      | |    | |____  | |____  | |  | |
// *  |_____/  (_) |_____/       |_|    |______|  \_____| |_|  |_|
// *
// *  ┈┈┈╭━━╮┈┈┈┈┈┈
// *  ┈┈╭╯┊◣╰━━━━╮┈┈
// *  ┈┈┃┊┊┊╱▽▽▽┛┈┈  -< Designed by Sedinir Consentini @ MMXXIII >-
// *  ┈┈┃┊┊┊~~~   ┈┈┈┈        -< Rio de Janeiro - Brazil >-
// *  ━━╯┊┊┊╲△△△┓┈┈
// *  ┊┊┊┊╭━━━━━━╯┈┈   --->  May the source be with you!  <---
// *
// ******************************************************************
 */