import 'package:isar/isar.dart';

part 'question_entity.g.dart';

@collection
class QuestionEntity {
  Id id = Isar.autoIncrement;
  
  // 表情符号
  String emoji;
  
  // 正确的拼音列表
  List<String> pinyin;
  
  // 带声调的拼音列表
  List<String> pinyin3;
  
  // 将嵌套的 List 转换为单个 List，每个选项用逗号分隔
  List<String> options;
  
  // 完成次数
  // -1 表示回答错误
  // 0 表示未完成
  // >0 表示完成次数
  @Index()
  int completionCount = 0;
  
  QuestionEntity({
    required this.emoji,
    required this.pinyin,
    required this.pinyin3,
    required this.options,
    this.completionCount = 0,
  });
  
  // 获取选项的辅助方法
  List<List<String>> getOptionsAsPairs() {
    return options.map((option) => option.split(',')).toList();
  }
  
  // 设置选项的辅助方法
  void setOptionsFromPairs(List<List<String>> pairs) {
    options = pairs.map((pair) => pair.join(',')).toList();
  }

  List<String> getRandomOptions() {
    var xs = options.toList();
    xs.shuffle();
    xs = xs.take(3).toList();
    xs.add(pinyin.join(' '));
    xs.shuffle();
    return xs;
  }
} 