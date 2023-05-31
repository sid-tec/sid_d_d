import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
//
import 'value.dart';
import 'failure.dart';

// #############################
// #  Ver: 3.0 - last: 30/01/23
// #  Nullsafety
// #  Composite Pattern
// #  Leaf Class for
// #  Validated Value Objects
// #############################

@immutable
abstract class ValueLeaf<T> extends Equatable implements Value<T> {
  //
  final T _value;
  //
  final String _what;
  //
  final Iterable<Failure> _failures;

  //
  // ===========================
  const ValueLeaf({
    required T value,
    required String what,
    required Iterable<Failure> failures,
  })  : _value = value,
        _failures = failures,
        _what = what;

  //
  // ===========================
  @override // FOR Value
  String get what => _what;

  //
  // ===========================
  @override // FOR Value
  T get value => _value;

  //
  // ===========================
  @override // FOR Value
  Iterable<Failure> get failures => _failures;

  //
  // ===========================
  @override // FOR Value
  bool get isValid => _failures.isEmpty;

  //
  // ===========================
  //@override // FOR Equatable
  //bool get stringify => true;
  @override
  String toString() {
    // TODO: implement toString
    return '| Value Leaf $runtimeType | What: $_what | Type: ${_value.runtimeType} | Value: $_value | Failures: $_failures !';
  }

  //
  // ===========================
  @override
  Map<String, dynamic> toMap() => {what: value};

/*  

  //
  // ===========================
  factory ValueLeaf.fromMap(Map<String, T> map) {
    return ValueLeaf(what: map[''])

  } */

  //
  // ===========================
  @override // FOR Equatable
  List<Object> get props => [
        _value as Object,
        _failures,
        _what,
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