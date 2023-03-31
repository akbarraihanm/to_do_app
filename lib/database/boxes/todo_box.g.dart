// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_box.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ToDoBoxAdapter extends TypeAdapter<ToDoBox> {
  @override
  final int typeId = 1;

  @override
  ToDoBox read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ToDoBox()
      ..todo = fields[0] as String?
      ..date = fields[1] as DateTime?
      ..status = fields[2] == null ? 0 : fields[2] as int?;
  }

  @override
  void write(BinaryWriter writer, ToDoBox obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.todo)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ToDoBoxAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
