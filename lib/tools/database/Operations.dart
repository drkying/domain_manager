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

  void add(T item, {int? key}) {
    if (key != null) {
      box.put(key, item);
    } else {
      box.add(item);
    }
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

  List<T> retrieveByProperty(String propertyName, dynamic value) {
    return box.values.where((item) {
      final itemAsMap = item as Map<String, dynamic>;
      return itemAsMap[propertyName] == value;
    }).toList();
  }

  List<T> retrieveAll() {
    return box.values.toList();
  }
}
