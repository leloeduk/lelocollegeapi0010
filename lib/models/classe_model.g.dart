// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'classe_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ClasseModelAdapter extends TypeAdapter<ClasseModel> {
  @override
  final int typeId = 0;

  @override
  ClasseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ClasseModel(
      id: fields[0] as int,
      nom: fields[1] as String,
      matieres: (fields[2] as List).cast<MatiereModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, ClasseModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.nom)
      ..writeByte(2)
      ..write(obj.matieres);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ClasseModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
