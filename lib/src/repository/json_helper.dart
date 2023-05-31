import 'dart:io';
import 'dart:convert';
import 'package:path/path.dart' as p;

abstract class JsonHelper {
  static String path(String what) =>
      p.join(Directory.current.path, 'lib\\src\\repository', '$what.json');

  static Future<Iterable> readJsonFile(String what) async {
    var r = jsonDecode(File(path(what)).readAsStringSync());
    return r[what];
  }

  static Future<void> saveJsonFile(
          {required Iterable<Map> mapList, required String what}) async =>
      File(path(what)).writeAsStringSync(json.encode({what: mapList}));
}
