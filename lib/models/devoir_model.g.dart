// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'devoir_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DevoirModelAdapter extends TypeAdapter<DevoirModel> {
  @override
  final int typeId = 3;

  @override
  DevoirModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DevoirModel(
      id: fields[0] as int,
      titre: fields[1] as String,
      description: fields[2] as String,
      matiere: fields[3] as MatiereModel,
      fichierPdf: fields[4] as String,
      date: fields[5] as String,
      annee: fields[6] as String,
      classe: fields[7] as ClasseModel,
      categorie: fields[8] as String,
      enseignant: fields[9] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DevoirModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.titre)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.matiere)
      ..writeByte(4)
      ..write(obj.fichierPdf)
      ..writeByte(5)
      ..write(obj.date)
      ..writeByte(6)
      ..write(obj.annee)
      ..writeByte(7)
      ..write(obj.classe)
      ..writeByte(8)
      ..write(obj.categorie)
      ..writeByte(9)
      ..write(obj.enseignant);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DevoirModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
