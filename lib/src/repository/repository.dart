import 'dart:io';
import 'dart:convert';
import 'package:path/path.dart' as p;

abstract class Repository {
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




/* import '../model/failure.dart';
import '../model/value_tree.dart';

abstract class Repository {
  Stream<(Iterable<Failure>, Iterable<ValueTree>)> watchAll();
  Stream<(Iterable<Failure>, Iterable<ValueTree>)> watchUncompleted();
  Future<Iterable<Failure>> create(ValueTree entity);
  Future<Iterable<Failure>> update(ValueTree entity);
  Future<Iterable<Failure>> delete(ValueTree entity);
} */