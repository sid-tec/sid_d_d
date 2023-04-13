// #############################
// #  Ver: 3.0 - last: 30/01/23
// #  Nullsafety
// #  Composite Pattern
// #  Interface Class for
// #  Validated Value Objects
// #############################

abstract class Value {
  //
  // ===========================
  String get what;

  //
  // ===========================
  Iterable<Map<String, dynamic>> get values;

  //
  // ===========================
  Iterable<Map<String, dynamic>> get failures;

  //
  // ===========================
  bool get valid;
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