import 'package:sid_d_d/sid_d_d.dart';

abstract class ValueRepository {
  Future<void> create(ValueTree tree);
  //Future<Iterable<ValueTree>> read(Iterable<ValueLeaf> ids);
  //Future<Iterable<ValueTree>> readAll();
  Future<Iterable<ValueTree>> read(ValueLeaf? id);
  Future<void> update(ValueTree tree);
  Future<void> delete(ValueLeaf id);
}
