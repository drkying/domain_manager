import 'package:hive/hive.dart';

part 'Domain.g.dart'; // Name of the TypeAdapter that will be generated for this class

@HiveType(typeId: 0)
class Domain {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String domain;

  @HiveField(3)
  final String registrar;

  @HiveField(4)
  final DateTime expiration;

  @HiveField(5)
  final DateTime lastUpdatedTime;

  Domain(this.id, this.name, this.domain, this.registrar, this.expiration, this.lastUpdatedTime);

  @override
  String toString() {
    return 'Domain{id: $id, name: $name, domain: $domain, registrar: $registrar, expiration: $expiration, lastUpdatedTime: $lastUpdatedTime}';
  }
}
