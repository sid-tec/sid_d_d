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
abstract class ValueLeaf<T> extends Equatable implements Value {
  //
  final T _value;
  //
  final String _what;
  //
  final List<Failure> _failures;

  //
  // ===========================
  const ValueLeaf({
    required T value,
    required String what,
    required List<Failure> failures,
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
  Iterable<Map<String, dynamic>> get values => [
        {what: _value}
      ];

  //
  // ===========================
  @override // FOR Value
  Iterable<Map<String, dynamic>> get failures => [
        {_what: _failures}
      ];

  //
  // ===========================
  @override // FOR Value
  bool get valid => _failures.isEmpty;

  //
  // ===========================
  @override // FOR Equatable
  bool get stringify => true;

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