/* import 'package:sid_d_d/src/library.dart';
import 'package:sid_d_d/src/validation/validation.dart';
import 'package:test/test.dart';

import 'package:sid_d_d/sid_d_d.dart';

// #############################################################################
// #  Ver: 0.1
// #  Nullsafety
// #  TODO: Comment class
// #
// #
// #############################################################################
void main() {
  group('Validation Classes Test', () {
    setUp(() {
      // Additional setup goes here.
    });
    //

    // ################################################
    // #  Ver: 3.0 - last: 05/01/23
    // #  Nullsafety
    // #  Test for
    // ################################################
    test('Validation Date Format Test', () {
      var validation = ValidatorDateFormat();
      // =====================================
      expect(
        validation.failures('2022-06-30 17:09:21.422952').isEmpty,
        true,
      );
      // =====================================
      expect(
        validation.failures('xxx'),
        [ValueFailureDateFormat(failValue: 'xxx')],
      );
    });

    // ################################################
    // #  Ver: 3.0 - last: 05/01/23
    // #  Nullsafety
    // #  Test for
    // ################################################
    test('Validation Name Test', () {
      var validation = ValidatorName();
      // =====================================
      expect(
        validation.failures('abcd'),
        [],
      );

      // =====================================
      expect(
        validation.failures('abc'),
        [
          ValueFailureMinLength(
            minLength: 4,
            failValue: 'abc',
          ),
        ],
      );

      // =====================================
      expect(
        validation.failures('abcdefghijk'),
        [
          ValueFailureMaxLength(
            maxLength: 10,
            failValue: 'abcdefghijk',
          ),
        ],
      );

      // =====================================
      expect(
        validation.failures(''),
        [
          ValueFailureIsNotEmpty(failValue: ''),
          ValueFailureMinLength(
            minLength: 4,
            failValue: '',
          ),
          ValueFailureRegExp(
            regExp: RegExp(r'^[a-zA-Z\s]+$'),
            failValue: '',
          ),
        ],
      );

      // =====================================
      expect(
        validation.failures('ab\nc d'),
        [ValueFailureSingleLine(failValue: 'ab\nc d')],
      );

      // =====================================
      expect(
        validation.failures('Hitler'),
        [
          ValueFailureFunction(
            failValue: 'Hitler',
            function: 'bool fun(v) => v != \'Hitler\';',
            failMessage: 'Name can\'t be Hitler',
          ),
        ],
      );

      //
    });

    // ################################################
    // #  Ver: 3.0 - last: 05/01/23
    // #  Nullsafety
    // #  Test for
    // ################################################
  });
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
// *  ┈┈┃┊┊┊╱▽▽▽┛┈┈  -< Designed by Sedinir Consentini @ MMXXII >-
// *  ┈┈┃┊┊┊~~~   ┈┈┈┈        -< Rio de Janeiro - Brazil >-
// *  ━━╯┊┊┊╲△△△┓┈┈
// *  ┊┊┊┊╭━━━━━━╯┈┈   --->  May the source be with you!  <---
// *
// ******************************************************************
 */