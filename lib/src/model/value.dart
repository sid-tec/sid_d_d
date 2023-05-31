// #############################
// #  Ver: 3.0 - last: 30/01/23
// #  Nullsafety
// #  Composite Pattern
// #  Interface Class for
// #  Validated Value Objects
// #############################

//abstract class Value<T> {
import 'package:sid_d_d/sid_d_d.dart';

abstract class Value<T> {
  //
  // ===========================
  String get what;

  //
  // ===========================
  T get value;

  //
  // ===========================
  Iterable<Failure> get failures;

  //
  // ===========================
  Map<String, dynamic> toMap();

/*   //
  // ===========================
  Value.fromMap(Map<String, T> map); */

  //
  // ===========================
  bool get isValid;
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