// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Domain.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DomainAdapter extends TypeAdapter<Domain> {
  @override
  final int typeId = 0;

  @override
  Domain read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Domain(
      fields[0] as int,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      fields[4] as DateTime,
      fields[5] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, Domain obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.domain)
      ..writeByte(3)
      ..write(obj.registrar)
      ..writeByte(4)
      ..write(obj.expiration)
      ..writeByte(5)
      ..write(obj.lastUpdatedTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DomainAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
