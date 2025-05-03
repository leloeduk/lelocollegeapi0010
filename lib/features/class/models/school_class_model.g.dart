// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'school_class_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SchoolClassModelAdapter extends TypeAdapter<SchoolClassModel> {
  @override
  final int typeId = 1;

  @override
  SchoolClassModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SchoolClassModel(
      id: fields[0] as int,
      nom: fields[1] as String,
      matieres: (fields[2] as List).cast<SubjectModel>(),
      author: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SchoolClassModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.nom)
      ..writeByte(2)
      ..write(obj.matieres)
      ..writeByte(3)
      ..write(obj.author);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SchoolClassModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
