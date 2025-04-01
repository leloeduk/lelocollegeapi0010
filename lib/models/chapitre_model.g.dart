// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapitre_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChapitreModelAdapter extends TypeAdapter<ChapitreModel> {
  @override
  final int typeId = 2;

  @override
  ChapitreModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChapitreModel(
      id: fields[0] as int,
      titre: fields[1] as String,
      fichierPdf: fields[2] as String,
      matiereId: fields[3] as int,
      categorie: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ChapitreModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.titre)
      ..writeByte(2)
      ..write(obj.fichierPdf)
      ..writeByte(3)
      ..write(obj.matiereId)
      ..writeByte(4)
      ..write(obj.categorie);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChapitreModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
