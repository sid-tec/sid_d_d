import '../model/validator.dart';
import '../model/failure.dart';

// #############################
// #  Ver: 3.0 - last: 30/01/23
// #  Nullsafety
// #  Class to check if is valid
// #  a dynamic value
// #  with a costum FUNCTION
// #############################

class ValidatorFunction implements Validator<dynamic> {
  //
  final bool Function(dynamic v) function;
  //
  final String functionLiteral;
  //
  // ===========================
  const ValidatorFunction(
      {required this.function,
      this.functionLiteral = 'Function Literal not given'});
  //
  // ===========================
  @override // FOR Validator
  Iterable<Failure> failures({required dynamic value}) => function(value)
      ? []
      : [
          Failure(
              'Fail to pass Function valitation! Value: $value, Type: ${value.runtimeType}, Function: "$functionLiteral"'),
        ];
}

// #############################
// #  Ver: 3.0 - last: 16/05/23
// #  Nullsafety
// #  Class to check if is valid
// #  a dynamic value
// #  with a costum FUNCTION
// #############################
class ValidatorIdDeezer implements Validator<int> {
  //
  @override // FOR ValidatorChecker
  Iterable<Failure> failures({required int value}) {
    var fList = <Failure>[];
    fList.addAll(ValidatorPositive().failures(value: value));
    fList.addAll(ValidatorMinValue(min: 1).failures(value: value));
    return fList;
  }
}

// #############################
// #  Ver: 3.0 - last: 16/05/23
// #  Nullsafety
// #  Class to check if is valid
// #  a dynamic value
// #  with a costum FUNCTION
// #############################
class ValidatorYear20century implements Validator<int> {
  //
  @override // FOR ValidatorChecker
  Iterable<Failure> failures({required int value}) {
    var fList = <Failure>[];
    fList.addAll(ValidatorPositive().failures(value: value));
    fList.addAll(ValidatorMinValue(min: 1901).failures(value: value));
    fList.addAll(
        ValidatorMaxValue(max: DateTime.now().year).failures(value: value));
    return fList;
  }
}

// #############################
// #  Ver: 3.0 - last: 16/05/23
// #  Nullsafety
// #  Class to check if is valid
// #  a dynamic value
// #  with a costum FUNCTION
// #############################
class ValidatorTitle implements Validator<String> {
  //
  @override // FOR ValidatorChecker
  Iterable<Failure> failures({required String value}) {
    var fList = <Failure>[];
    fList.addAll(ValidatorNotEmpty().failures(value: value));
    fList.addAll(ValidatorSingleLine().failures(value: value));
    fList.addAll(ValidatorMinLength(min: 2).failures(value: value));
    fList.addAll(ValidatorMaxLength(max: 130).failures(value: value));
    return fList;
  }
}

// #############################
// #  Ver: 3.0 - last: 16/05/23
// #  Nullsafety
// #  Class to check if is valid
// #  a dynamic value
// #  with a costum FUNCTION
// #############################
class ValidatorArtistName implements Validator<String> {
  //
  @override // FOR ValidatorChecker
  Iterable<Failure> failures({required String value}) {
    var fList = <Failure>[];
    fList.addAll(ValidatorNotEmpty().failures(value: value));
    fList.addAll(ValidatorSingleLine().failures(value: value));
    fList.addAll(ValidatorMinLength(min: 2).failures(value: value));
    fList.addAll(ValidatorMaxLength(max: 130).failures(value: value));
    return fList;
  }
}

// #############################
// #  Ver: 3.0 - last: 16/05/23
// #  Nullsafety
// #  Class to check if is valid
// #  a dynamic value
// #  with a costum FUNCTION
// #############################
class ValidatorArtists implements Validator<Iterable<int>> {
  //
  @override // FOR ValidatorChecker
  Iterable<Failure> failures({required Iterable<int> value}) {
    var fList = <Failure>[];
    if (value.isEmpty) {
      fList.add(Failure('An Album must have at least 1 Artist'));
    }
    for (var artist in value) {
      fList.addAll(ValidatorIdDeezer().failures(value: artist));
    }
    return fList;
  }
}

// #############################
// #  Ver: 3.0 - last: 30/01/23
// #  Nullsafety
// #  Class to check if is valid
// #  a Positive Num
// #############################

class ValidatorPositive implements Validator<num> {
  //
  // ===========================
  @override // FOR Validator
  Iterable<Failure> failures({required num value}) => value.isNegative
      ? [
          Failure(
              'Value must be positive! Value: $value, Type: ${value.runtimeType}'),
        ]
      : [];
}

// #############################
// #  Ver: 3.0 - last: 30/01/23
// #  Nullsafety
// #  Class to check if is valid
// #  a Negative Num
// #############################

class ValidatorNegative implements Validator<num> {
  //
  // ===========================
  @override
  Iterable<Failure> failures({required num value}) => value.isNegative
      ? []
      : [
          Failure(
              'Value must be negative! Value: $value, Type: ${value.runtimeType}')
        ];
}

// #############################
// #  Ver: 3.0 - last: 30/01/23
// #  Nullsafety
// #  Class to check if is valid
// #  a Min Num
// #############################
class ValidatorMinValue implements Validator<num> {
  //
  final num min;
  //
  const ValidatorMinValue({required this.min});
  //
  @override // FOR Validator
  Iterable<Failure> failures({required num value}) => value >= min
      ? []
      : [
          Failure(
              'Value must be equal or higher than $min! Value: $value, Type: ${value.runtimeType}')
        ];
}

// #############################
// #  Ver: 3.0 - last: 30/01/23
// #  Nullsafety
// #  Class to check if is valid
// #  a dynamic value
// #  with a costum FUNCTION
// #############################
//
// ===========================
// ################################################
// #  Ver: 3.0 - last: 19/01/23
// #  Nullsafety
// #  Class to check if is valid a Min Num
// ################################################
class ValidatorMaxValue implements Validator<num> {
  //
  final num max;
  //
  const ValidatorMaxValue({required this.max});
  //
  @override // FOR Validator
  Iterable<Failure> failures({required num value}) => value <= max
      ? []
      : [
          Failure(
              'Value must be equal or lower than $max! Value: $value, Type: ${value.runtimeType}')
        ];
}

// #############################
// #  Ver: 3.0 - last: 30/01/23
// #  Nullsafety
// #  Class to check if is valid
// #  a dynamic value
// #  with a costum FUNCTION
// #############################
//
// ===========================
// ################################################
// #  Ver: 3.0 - last: 19/01/23
// #  Nullsafety
// #  Class to check if is valid a String RegExp
// ################################################
class ValidatorRegExp implements Validator<String> {
  //
  final RegExp regExp;
  //
  const ValidatorRegExp({required this.regExp});
  //
  @override // FOR Validator
  Iterable<Failure> failures({required String value}) => regExp.hasMatch(value)
      ? []
      : [
          Failure(
              'Value must match "$regExp"! Value: $value, Type: ${value.runtimeType}')
        ];
}

// #############################
// #  Ver: 3.0 - last: 30/01/23
// #  Nullsafety
// #  Class to check if is valid
// #  a dynamic value
// #  with a costum FUNCTION
// #############################
//
// ===========================
// ################################################
// #  Ver: 3.0 - last: 19/01/23
// #  Nullsafety
// #  Class to check if is valid a String Min Length
// ################################################
class ValidatorMinLength implements Validator<String> {
  //
  final int min;
  //
  const ValidatorMinLength({required this.min});
  //
  @override // FOR Validator
  Iterable<Failure> failures({required String value}) => value.length >= min
      ? []
      : [
          Failure(
              'Value length must be higher than $min! Value: $value, Type: ${value.runtimeType}')
        ];
}

// #############################
// #  Ver: 3.0 - last: 30/01/23
// #  Nullsafety
// #  Class to check if is valid
// #  a dynamic value
// #  with a costum FUNCTION
// #############################
//
// ===========================
// ################################################
// #  Ver: 3.0 - last: 19/01/23
// #  Nullsafety
// #  Class to check if is valid a String Max Length
// ################################################
class ValidatorMaxLength implements Validator<String> {
  //
  final int max;
  //
  const ValidatorMaxLength({required this.max});
  //
  @override // FOR Validator
  Iterable<Failure> failures({required String value}) => value.length <= max
      ? []
      : [
          Failure(
              'Value length must be lower than $max! Value: $value, Type: ${value.runtimeType}')
        ];
}

// #############################
// #  Ver: 3.0 - last: 30/01/23
// #  Nullsafety
// #  Class to check if is valid
// #  a dynamic value
// #  with a costum FUNCTION
// #############################
//
// ===========================
// ################################################
// #  Ver: 3.0 - last: 19/01/23
// #  Nullsafety
// #  Class to check if is valid a String Single Line
// ################################################
class ValidatorSingleLine implements Validator<String> {
  //
  @override // FOR Validator
  Iterable<Failure> failures({required String value}) => value.contains('\n')
      ? [
          Failure(
              'Value must be single line! Value: ${value.replaceAll(RegExp(r'\n'), '\\n')}, Type: ${value.runtimeType}')
        ]
      : [];
}

// #############################
// #  Ver: 3.0 - last: 30/01/23
// #  Nullsafety
// #  Class to check if is valid
// #  a dynamic value
// #  with a costum FUNCTION
// #############################
//
// ===========================
// ################################################
// #  Ver: 3.0 - last: 19/01/23
// #  Nullsafety
// #  Class to check if is valid a String  Empty
// ################################################
class ValidatorNotEmpty implements Validator<String> {
  //
  @override // FOR Validator
  Iterable<Failure> failures({required String value}) => value.isEmpty
      ? [
          Failure(
              'Value must NOT be empty! Value: "$value", Type: ${value.runtimeType}')
        ]
      : [];
}
// ################################################
// #  Ver: 3.0 - last: 19/01/23
// #  Nullsafety
// #  Class to check if is valid a String  Empty
// ################################################
class ValidatorOneWord implements Validator<String> {
  //
  @override // FOR Validator
  Iterable<Failure> failures({required String value}) => value.contains(' ')
      ? [
          Failure(
              'Value must be only one word, without spaces! Value: "$value", Type: ${value.runtimeType}')
        ]
      : [];
}

// ################################################
// #  Ver: 3.0 - last: 19/01/23
// #  Nullsafety
// #  Class to check if is valid a String  Empty
// ################################################
class ValidatorPoliWords implements Validator<String> {
  //
  @override // FOR Validator
  Iterable<Failure> failures({required String value}) 
    => value.indexOf(' ') > 0 
    && value.substring(value.length-1) != ' '
      ? []
      : [
          Failure(
              'Value must be more than one word, with space! Value: "$value", Type: ${value.runtimeType}')
        ];
}

// #############################
// #  Ver: 3.0 - last: 30/01/23
// #  Nullsafety
// #  Class to check if is valid
// #  a dynamic value
// #  with a costum FUNCTION
// #############################
//
// ===========================
// ################################################
// #  Ver: 3.0 - last: 19/01/23
// #  Nullsafety
// #  Class to check if is valid a String Date Format
// ################################################
class ValidatorDateFormat implements Validator<String> {
  //
  @override // FOR Validator
  Iterable<Failure> failures({required String value}) =>
      DateTime.tryParse(value) != null
          ? []
          : [
              Failure(
                  'Value must be in DateTime format! Value: $value, Type: ${value.runtimeType}')
            ];
}

class ValidatorPastDateTime implements Validator<String> {
  //
  @override // FOR Validator
  Iterable<Failure> failures({required String value}) {
    var fList = <Failure>[];
    fList.addAll(ValidatorDateFormat().failures(value: value));
    final now = DateTime.now();
    final comparison = fList.isEmpty ? now.compareTo(DateTime.parse(value)) : 0;
    if (fList.isEmpty && comparison < 0) {
      fList.add(Failure(
          'Value must be a DateTime before now! Value: $value, Type: ${value.runtimeType}'));
    }
    return fList;
  }
}

class ValidatorFutureDateTime implements Validator<String> {
  //
  @override // FOR Validator
  Iterable<Failure> failures({required String value}) {
    var fList = <Failure>[];
    fList.addAll(ValidatorDateFormat().failures(value: value));
    final now = DateTime.now();
    final comparison = fList.isEmpty ? now.compareTo(DateTime.parse(value)) : 0;
    if (fList.isEmpty && comparison > 0) {
      fList.add(Failure(
          'Value must be a DateTime after now! Value: $value, Type: ${value.runtimeType}'));
    }
    return fList;
  }
}

// #############################
// #  Ver: 3.0 - last: 30/01/23
// #  Nullsafety
// #  Class to check if is valid
// #  a dynamic value
// #  with a costum FUNCTION
// #############################
//
// ===========================
// ################################################
// #  Ver: 3.0 - last: 01/01/23
// #  Nullsafety
// #  Class to check if is valid a String Uuid
// TODO: Realy validade UUID
// ################################################
class ValidatorUuid implements Validator<String> {
  //
  @override // FOR ValidatorChecker
  Iterable<Failure> failures({required String value}) => value != ''
      ? []
      : [
          Failure(
              'Value must be a valid UUid! Value: $value, Type: ${value.runtimeType}')
        ];
}
//
//          ┈┈┈╭━━╮┈┈┈┈┈┈
//          ┈┈╭╯┊◣╰━━━━╮┈┈
//          ┈┈┃┊┊┊╱▽▽▽┛┈┈  
//          ┈┈┃┊┊┊~~~   ┈┈┈┈
//          ━━╯┊┊┊╲△△△┓┈┈
//          ┊┊┊┊╭━━━━━━╯┈┈  
//         _____   _   _____   
//        / ____| | | |  __ \  
//       | (___   | | | |  | | 
//        \___ \  | | | |  | | 
//        ____) | |_| | |__| | 
//       |_____/  (_) |_____/  
//     _______   ______    _____ 
//    |__   __| |  ____|  / ____|
//       | |    | |__    | |     
//       | |    |  __|   | |     
//       | |    | |____  | |____ 
//       |_|    |______|  \_____|
//
//-< Designed by Sedinir Consentini >-
//  -< Rio de Janeiro  @  MMXXIII >-  
//--> May the source be with you! <---
//13