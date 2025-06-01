// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pinyin_question.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PinyinQuestionAdapter extends TypeAdapter<PinyinQuestion> {
  @override
  final int typeId = 0;

  @override
  PinyinQuestion read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PinyinQuestion(
      pinyin: fields[0] as String,
      audioPath: fields[1] as String,
      emoji: fields[2] as String,
      options: (fields[3] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, PinyinQuestion obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.pinyin)
      ..writeByte(1)
      ..write(obj.audioPath)
      ..writeByte(2)
      ..write(obj.emoji)
      ..writeByte(3)
      ..write(obj.options);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PinyinQuestionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
