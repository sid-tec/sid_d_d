import '../model/failure.dart';
import '../model/value_tree.dart';

abstract class Repository {
  Stream<(Iterable<Failure>, Iterable<ValueTree>)> watchAll();
  Stream<(Iterable<Failure>, Iterable<ValueTree>)> watchUncompleted();
  Future<Iterable<Failure>> create(ValueTree entity);
  Future<Iterable<Failure>> update(ValueTree entity);
  Future<Iterable<Failure>> delete(ValueTree entity);
}