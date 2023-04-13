import 'package:equatable/equatable.dart';
//
import 'value.dart';

// #############################
// #  Ver: 3.0 - last: 30/01/23
// #  Nullsafety
// #  Composite Pattern
// #  Tree Class for
// #  Validated Value Objects
// #############################

class ValueTree extends Equatable implements Value {
  //
  final String _what;
  //
  final Iterable<Value> _values;

  //
  // ===========================
  ValueTree({
    required String what,
    required Iterable<Value> values,
  })  : _what = what,
        _values = values;

  //
  // ===========================
  @override // FOR Value
  String get what => _what;

  //
  // ===========================
  @override // FOR Value
  Iterable<Map<String, dynamic>> get values {
    //
    var map = <String, dynamic>{what: {}};
    //
    for (final value in _values) {
      map[what].addAll(value.values.first);
    }
    //
    return [map];
  }

  //
  // ===========================
  @override // FOR Value
  Iterable<Map<String, dynamic>> get failures {
    //
    var map = <String, dynamic>{what: {}};
    //
    for (final value in _values) {
      map[what].addAll(value.failures.first);
    }
    //
    return [map];
  }

  //
  // ===========================
  @override // FOR Value
  bool get valid {
    for (final value in _values) {
      if (!value.valid) return false;
    }
    //
    return true;
  }

  //
  // ===========================
  @override // FOR Equatable
  bool get stringify => true;
  //
  // ===========================
  @override // FOR Equatable
  List<Object> get props => [
        _values,
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