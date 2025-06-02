import 'package:hive/hive.dart';

part 'pinyin_question.g.dart';

@HiveType(typeId: 0)
class PinyinQuestion extends HiveObject {
  @HiveField(0)
  final String pinyin;

  @HiveField(1)
  final String audioPath;

  @HiveField(2)
  final String emoji;

  @HiveField(3)
  final List<String> options;

  PinyinQuestion({
    required this.pinyin,
    required this.audioPath,
    required this.emoji,
    required this.options,
  });

  factory PinyinQuestion.fromJson(Map<String, dynamic> json) {
    return PinyinQuestion(
      pinyin: json['pinyin'] as String,
      audioPath: json['audioPath'] as String,
      emoji: json['emoji'] as String,
      options: List<String>.from(json['options'] as List),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pinyin': pinyin,
      'audioPath': audioPath,
      'emoji': emoji,
      'options': options,
    };
  }
} 