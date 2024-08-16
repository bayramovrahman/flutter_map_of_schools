// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'school_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SchoolModelAdapter extends TypeAdapter<SchoolModel> {
  @override
  final int typeId = 0;

  @override
  SchoolModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SchoolModel(
      id: fields[0] as String?,
      code: fields[1] as String?,
      name: fields[2] as String?,
      fullName: fields[3] as String?,
      description: fields[4] as dynamic,
      address: fields[5] as String?,
      avatar: fields[6] as String?,
      background: fields[7] as dynamic,
      phone: fields[8] as String?,
      email: fields[9] as dynamic,
      level: fields[10] as String?,
      galleries: fields[11] as dynamic,
      latitude: fields[12] as String?,
      longitude: fields[13] as String?,
      isDigitalized: fields[14] as bool?,
      isSecondarySchool: fields[15] as bool?,
      updatedAt: fields[16] as DateTime?,
      createdAt: fields[17] as DateTime?,
      archivedAt: fields[18] as dynamic,
      timetablesCount: fields[19] as int?,
      classroomsCount: fields[20] as int?,
      parent: fields[21] as dynamic,
      admin: fields[22] as dynamic,
      specialist: fields[23] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, SchoolModel obj) {
    writer
      ..writeByte(24)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.code)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.fullName)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.address)
      ..writeByte(6)
      ..write(obj.avatar)
      ..writeByte(7)
      ..write(obj.background)
      ..writeByte(8)
      ..write(obj.phone)
      ..writeByte(9)
      ..write(obj.email)
      ..writeByte(10)
      ..write(obj.level)
      ..writeByte(11)
      ..write(obj.galleries)
      ..writeByte(12)
      ..write(obj.latitude)
      ..writeByte(13)
      ..write(obj.longitude)
      ..writeByte(14)
      ..write(obj.isDigitalized)
      ..writeByte(15)
      ..write(obj.isSecondarySchool)
      ..writeByte(16)
      ..write(obj.updatedAt)
      ..writeByte(17)
      ..write(obj.createdAt)
      ..writeByte(18)
      ..write(obj.archivedAt)
      ..writeByte(19)
      ..write(obj.timetablesCount)
      ..writeByte(20)
      ..write(obj.classroomsCount)
      ..writeByte(21)
      ..write(obj.parent)
      ..writeByte(22)
      ..write(obj.admin)
      ..writeByte(23)
      ..write(obj.specialist);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SchoolModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
