/* import 'package:test/test.dart';

import 'package:sid_d_d/sid_d_d.dart';

void main() {
  group(
    'A group of tests',
    () {
      final notDate = Date(value: 'Sid');
      final date = Date(value: '2022-06-30 17:09:21.422952');
      final dateCopy = Date(value: '2022-06-30 17:09:21.422952');
      final dateToo = Date(value: '2021-06-30 17:09:21.422952');

      setUp(
        () {
          // Additional setup goes here.
        },
      );

      test(
        'Get Or Crash',
        () {
          /* expect(
            sid.getOrCrash,
            Error,
          ); */
          expect(
            date.getOrCrash,
            '2022-06-30 17:09:21.422952',
          );
          /* expect(
            sidCompleto.getOrCrash,
            Error,
          ); */
        },
      );

      test(
        'Get or Else ',
        () {
          expect(
            notDate.getOr(replace: 'Erro'),
            'Erro',
          );
          expect(
            date.getOr(replace: 'Erro'),
            '2022-06-30 17:09:21.422952',
          );
          expect(
            dateCopy.getOr(replace: 'Erro'),
            '2022-06-30 17:09:21.422952',
          );
          expect(
            dateToo.getOr(replace: 'Erro'),
            '2021-06-30 17:09:21.422952',
          );
        },
      );

      test(
        'Igualdade',
        () {
          expect(
            date == dateCopy,
            true,
          );
          expect(
            date == dateToo,
            false,
          );
        },
      );

      test(
        'Is Valid ',
        () {
          expect(
            notDate.failures.isEmpty,
            false,
          );
          expect(
            date.failures.isEmpty,
            true,
          );
          expect(
            dateToo.failures.isEmpty,
            true,
          );
        },
      );
    },
  );
}
 */