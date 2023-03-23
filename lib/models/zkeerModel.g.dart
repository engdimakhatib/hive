// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'zkeerModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ZkeerModelAdapter extends TypeAdapter<ZkeerModel> {
  @override
  final int typeId = 0;

  @override
  ZkeerModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ZkeerModel(
      title: fields[0] as String,
      date: fields[2] as String,
      color: fields[3] as int,
      maxNum: fields[5] as int,
      subZkeer: (fields[1] as HiveList?)?.castHiveList(),
      done: fields[4] as bool,
      curNum: fields[6] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ZkeerModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.subZkeer)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.color)
      ..writeByte(4)
      ..write(obj.done)
      ..writeByte(5)
      ..write(obj.maxNum)
      ..writeByte(6)
      ..write(obj.curNum);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ZkeerModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
