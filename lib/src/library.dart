// #############################
// #  Ver: 3.0 - last: 30/01/23
// #  Nullsafety
// #  Library for
// #  Sid D D
// #############################

export 'model/failure.dart' show Failure;
//
export 'model/validator.dart' show Validator;
export 'implementation/validator_classes.dart'
    show
        ValidatorUuid,
        ValidatorFunction,
        ValidatorRegExp,
        ValidatorNotEmpty,
        ValidatorSingleLine,
        ValidatorMinLength,
        ValidatorMaxLength,
        ValidatorDateFormat,
        ValidatorPastDateTime,
        ValidatorFutureDateTime,
        ValidatorPositive,
        ValidatorNegative,
        ValidatorMaxValue,
        ValidatorMinValue;
//
export 'model/value.dart' show Value;
export 'model/value_leaf.dart' show ValueLeaf;
export 'implementation/value_leaf_classes.dart'
    show
        UniqueId,
        BoolVo,
        Name,
        Date,
        DurationSeconds,
        DeezerId,
        LocalFile,
        UrlAddress,
        Upc;
//
export 'model/value_tree.dart' show ValueTree;
export 'implementation/value_tree_classes.dart' show Address, Person;
//
export 'helper.dart' show Helper;
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