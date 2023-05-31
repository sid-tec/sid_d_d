import 'package:uuid/uuid.dart';

class VirtualDB {
  final _items = <String, Map<String, dynamic>>{};

  static final VirtualDB _db = VirtualDB._privateConstructor();

  VirtualDB._privateConstructor();

  factory VirtualDB() {
    return _db;
  }

  Future<void> create(Map<String, dynamic> item) async {
    item['id'] = Uuid().v1();
    _items.putIfAbsent(item['id'], () => item);
  }

  Future<Map<String, dynamic>?> read(String id) async => _items[id];

  Future<Iterable<Map<String, dynamic>>> readAll() async {
    await Future.delayed(Duration(milliseconds: 800));
    return _items.values;
  }

  Future<void> update(Map<String, dynamic> updatedItem) async {
    _items[updatedItem['id']] = updatedItem;
  }

  Future<void> delete(String id) async => _items.remove(id);
}
