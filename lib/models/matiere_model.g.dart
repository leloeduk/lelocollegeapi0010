// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matiere_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MatiereModelAdapter extends TypeAdapter<MatiereModel> {
  @override
  final int typeId = 1;

  @override
  MatiereModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MatiereModel(
      id: fields[0] as int,
      nom: fields[1] as String,
      classeId: fields[2] as int,
      chapitres: (fields[3] as List).cast<ChapitreModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, MatiereModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.nom)
      ..writeByte(2)
      ..write(obj.classeId)
      ..writeByte(3)
      ..write(obj.chapitres);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MatiereModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
