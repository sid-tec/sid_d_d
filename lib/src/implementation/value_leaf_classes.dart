import 'package:uuid/uuid.dart';
//
import '../model/value_leaf.dart';
import '../model/failure.dart';
import 'validator_classes.dart';

// PRIMITIVES =============================================

//
// ===========================
class Boolean extends ValueLeaf<bool> {
  Boolean({required super.value, required super.what}) : super(failures: []);
}

// ID =================================================================

//
// ===========================
class UniqueId extends ValueLeaf<String> {
  UniqueId({required String uid})
      : super(
          value: uid.isEmpty ? Uuid().v1() : uid,
          failures: [],
          what: 'uid',
        );
}

//
// ===========================
class IdDeezer extends ValueLeaf<int> {
  IdDeezer({required super.value, required super.what})
      : super(failures: ValidatorIdDeezer().failures(value: value));
}

//
// ===========================
class Upc extends ValueLeaf<int> {
  static List<Failure> validators(int value) {
    final min = ValidatorMinValue(min: 1);
    var list = <Failure>[];
    list.addAll(min.failures(value: value));
    return list;
  }

  Upc({required super.value, required super.what})
      : super(
          failures: validators(value),
        );
}

// DATE TIME ==========================================================

//
// ===========================
class Date extends ValueLeaf<String> {
  Date({required super.value, required super.what})
      : super(
          failures: ValidatorDateFormat().failures(value: value),
        );
}

//
// ===========================
class Seconds extends ValueLeaf<int> {
  Seconds({required super.value, required super.what})
      : super(
          failures: ValidatorPositive().failures(value: value),
        );
}

//
// ===========================
class Year extends ValueLeaf<int> {
  Year({required super.value, required super.what})
      : super(failures: ValidatorYear20century().failures(value: value));
}

// NAMES TITLES ETC STRING ===============================================

//
// ===========================
class ArtistName extends ValueLeaf<String> {
  ArtistName({required super.value, required super.what})
      : super(failures: ValidatorArtistName().failures(value: value));
}

//
// ===========================
class Title extends ValueLeaf<String> {
  Title({required super.value, required super.what})
      : super(failures: ValidatorTitle().failures(value: value));
}

//
// ===========================
class Name extends ValueLeaf<String> {
  static List<Failure> validators(String value) {
    final notEmpty = ValidatorNotEmpty();
    final singleLine = ValidatorSingleLine();
    final minLength = ValidatorMinLength(min: 4);
    final maxLength = ValidatorMaxLength(max: 10);
    final regExp = ValidatorRegExp(regExp: RegExp(r'^[a-zA-Z\s]+$'));
    final function = ValidatorFunction(
      function: (v) => v != 'Hitler',
      functionLiteral: 'bool fun(v) => v != \'Hitler\';',
    );
    var list = <Failure>[];
    list.addAll(notEmpty.failures(value: value));
    list.addAll(singleLine.failures(value: value));
    list.addAll(minLength.failures(value: value));
    list.addAll(maxLength.failures(value: value));
    list.addAll(regExp.failures(value: value));
    list.addAll(function.failures(value: value));
    return list;
  }

  Name({required super.value, required super.what})
      : super(
          failures: validators(value),
        );
}

// INTERNET E FILE SYSTEM ===============================================

//
// ===========================
class UrlAddress extends ValueLeaf<String> {
  static List<Failure> validators(String value) {
    var list = <Failure>[];
    list.addAll(ValidatorNotEmpty().failures(value: value));
    list.addAll(ValidatorSingleLine().failures(value: value));
    final regExp =
        RegExp(r'(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+');
    list.addAll(ValidatorRegExp(regExp: regExp).failures(value: value));
    return list;
  }

  UrlAddress({required super.value, required super.what})
      : super(failures: validators(value));
}

//
// ===========================
class LocalFile extends ValueLeaf<String> {
  static List<Failure> validators(String value) {
    final notEmpty = ValidatorNotEmpty();
    final singleLine = ValidatorSingleLine();
    final minLength = ValidatorMinLength(min: 4);
    final maxLength = ValidatorMaxLength(max: 10);
    final regExp = ValidatorRegExp(regExp: RegExp(r'^[a-zA-Z\s]+$'));
    final function = ValidatorFunction(
      function: (v) => v != 'Hitler',
      functionLiteral: 'bool fun(v) => v != \'Hitler\';',
    );
    var list = <Failure>[];
    list.addAll(notEmpty.failures(value: value));
    list.addAll(singleLine.failures(value: value));
    list.addAll(minLength.failures(value: value));
    list.addAll(maxLength.failures(value: value));
    list.addAll(regExp.failures(value: value));
    list.addAll(function.failures(value: value));
    return list;
  }

  //
  // ===========================
  LocalFile({required super.value, required super.what})
      : super(
          failures: validators(value),
        );
}

//
// ===========================
class LocalPath extends ValueLeaf<String> {
  static List<Failure> validators(String value) {
    final notEmpty = ValidatorNotEmpty();
    final singleLine = ValidatorSingleLine();
    final minLength = ValidatorMinLength(min: 4);
    final maxLength = ValidatorMaxLength(max: 10);
    final regExp = ValidatorRegExp(regExp: RegExp(r'^[a-zA-Z\s]+$'));
    final function = ValidatorFunction(
      function: (v) => v != 'Hitler',
      functionLiteral: 'bool fun(v) => v != \'Hitler\';',
    );
    var list = <Failure>[];
    list.addAll(notEmpty.failures(value: value));
    list.addAll(singleLine.failures(value: value));
    list.addAll(minLength.failures(value: value));
    list.addAll(maxLength.failures(value: value));
    list.addAll(regExp.failures(value: value));
    list.addAll(function.failures(value: value));
    return list;
  }

  //
  // ===========================
  LocalPath({required super.value, required super.what})
      : super(
          failures: validators(value),
        );
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