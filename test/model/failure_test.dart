import 'package:test/test.dart';
//
import 'package:sid_d_d/sid_d_d.dart';

void main() {
  group(
    'A group of tests for Failure class',
    () {
      final failure = Failure('Message of Failure');
      final sameFailure = Failure('Message of Failure');
      final otherFailure = Failure('Diferent Message of Failure');

      setUp(() {/* Additional setup goes here. */});

      test(
        'To String',
        () {
          expect(
            failure.toString(),
            'Message of Failure',
          );
        },
      );

      test(
        'Access To Message member',
        () {
          expect(
            failure.message,
            'Message of Failure',
          );
        },
      );

      test(
        'Equality',
        () {
          expect(
            failure == sameFailure,
            true,
          );
          expect(
            failure == otherFailure,
            false,
          );
        },
      );
    },
  );
}
