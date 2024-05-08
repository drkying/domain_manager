import 'package:hive/hive.dart';

class Operations<T> {
  late Box<T> box;
  final String databaseName;

  Operations(this.databaseName) {
    openBox();
  }

  Future openBox() async {
    box = await Hive.openBox<T>(databaseName);
  }

  void add(int key, T item) {
    box.put(key, item);
  }

  void delete(int key) {
    box.delete(key);
  }

  void update(int key, T item) {
    box.put(key, item);
  }

  T? retrieve(int key) {
    return box.get(key);
  }
}