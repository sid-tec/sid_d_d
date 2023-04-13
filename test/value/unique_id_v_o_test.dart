/* import 'package:test/test.dart';
import 'package:sid_d_d/sid_d_d.dart';

void main() {
  group(
    'tests on UniqueId',
    () {
      final id1 = UniqueId(value: '');
      final id2 = UniqueId(value: '');
      final id3 = UniqueId(value: '12a34b56c');

      setUp(() {
        // Additional setup goes here.
      });

      test(
        'Get Or Crash',
        () {
          expect(
            id3.getOrCrash,
            '12a34b56c',
          );
        },
      );

      test(
        'Igualdade',
        () {
          expect(
            id1 == id2,
            false,
          );
        },
      );

      test(
        'failures',
        () {
          expect(
            id1.failures.isEmpty,
            true,
          );
          expect(
            id2.failures,
            [],
          );
        },
      );
    },
  );
}
 */