// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ImageItemAdapter extends TypeAdapter<ImageItem> {
  @override
  final int typeId = 0;

  @override
  ImageItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ImageItem(
      image: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ImageItem obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImageItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
