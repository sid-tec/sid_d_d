abstract class Helper {
  static void treePrint(Map i) {
    for (var element in i.entries) {
      if (element.value is Map) {
        print(' ===== ${element.key} ======');
        Helper.treePrint(element.value);
        //print('\n');
      } else {
        print('${element.key} -> ${element.value}');
      }
    }
  }
}
