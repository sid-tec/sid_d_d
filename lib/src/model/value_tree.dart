import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
//
import 'value.dart';
import 'failure.dart';

// #############################
// #  Ver: 3.0 - last: 30/01/23
// #  Nullsafety
// #  Composite Pattern
// #  Tree Class for
// #  Validated Value Objects
// #############################

@immutable
abstract class ValueTree extends Equatable implements Value<Iterable<Value>> {
  //
  final Iterable<Value> _values;
  //
  final String _what;

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
  Iterable<Value> get value => _values;

  //
  // ===========================
  @override // FOR Value
  Iterable<Failure> get failures {
    //
    var f = <Failure>[];
    //
    for (final value in _values) {
      f.addAll(value.failures);
    }
    //
    return f;
  }

  //
  // ===========================
  @override // FOR Value
  bool get isValid => failures.isEmpty;

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