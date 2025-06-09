import 'package:pinyin/data/models/question_entity.dart';

class EmojiQuestion {
  final String emoji;
  final String answer;
  final List<String> options;
  final int id;

  EmojiQuestion({required this.emoji, required this.answer, required this.options, required this.id});

  factory EmojiQuestion.fromEntity(QuestionEntity entity) {
    return EmojiQuestion(
      id: entity.id,
      emoji: entity.emoji,
      answer: entity.pinyin.join(' '),
      options: entity.getRandomOptions(),
    );
  }
}