
class QuestionEntity {
  final int id;

  /// 类型 1:根据pinyin 选取正确的emoji，此时选项为emoji
  /// 类型 2：根据emoji 选取正确的pinyin，此时选项为pinyin
  /// 类型 3：根据音频 选取正确的pinyin，此时选项为pinyin
  /// 类型 4：根据pinyin 读出正确的汉字，此时答案为汉字
  /// 类型 5：根据图片 选取正确的pinyin，此时选项为pinyin
  /// 类型 6：根据pinyin 读出正确的图片，此时选项为图片
  final int type;
  final String pinyin;
  final String optionA;
  final String optionB;
  final String optionC;
  final String optionD;
  final String answer;
  final List<String> audio;
  final String emoji;
  final String image;


  QuestionEntity({
    required this.id,
    required this.type,
    required this.pinyin,
    required this.optionA,
    required this.optionB,
    required this.optionC,
    required this.optionD,
    required this.answer,
    required this.audio,
    required this.emoji,
    required this.image,
  });

  bool answerIsCorrect(String answer) {
    return this.answer == answer;
  }
  
}