/* import 'package:test/test.dart';
import 'package:sid_d_d/src/value/value_classes.dart';

void main() {
  group(
    'A group of tests',
    () {
      final sid = Name(value: 'Sid');
      final sedinir = Name(value: 'Sedinir');
      final sedin = Name(value: 'Sedin');
      final sedinir2 = Name(value: 'Sedinir');
      final sidCompleto = Name(value: 'Sedinir Consentini de Souza');

      setUp(
        () {
          // Additional setup goes here.
        },
      );

      test(
        'Get Or Crash',
        () {
          expect(
            sid.getOrCrash,
            throwsA(Error()),
          );
          /* 
          expect(
            sedinir.getOrCrash,
            'Sedinir',
          );
          expect(
            sidCompleto.getOrCrash,
            Error,
          ); */
        },
      );

      test(
        'Get or Else ',
        () {
          expect(
            sid.getOr(replace: 'Erro'),
            'Erro',
          );
          expect(
            sedinir.getOr(replace: 'Erro'),
            'Sedinir',
          );
          expect(
            sidCompleto.getOr(replace: 'Erro'),
            'Erro',
          );
        },
      );

      test(
        'Igualdade',
        () {
          expect(
            sedinir == sedinir2,
            true,
          );
          expect(
            sedinir == sedin,
            false,
          );
        },
      );

      test(
        'Is Valid ',
        () {
          expect(
            sid.failures.isEmpty,
            false,
          );
          expect(
            sidCompleto.failures.isEmpty,
            false,
          );
          expect(
            sedinir.failures.isEmpty,
            true,
          );
        },
      );
    },
  );
}
 */