import '../../data/models/pinyin_question.dart';

/// 问题仓库接口
/// 定义问题相关的业务操作
abstract class QuestionRepository {
  /// 获取所有问题
  Future<List<PinyinQuestion>> getAllQuestions();
  
  /// 获取随机问题
  Future<List<PinyinQuestion>> getRandomQuestions(int count);
  
  /// 根据拼音获取问题
  Future<PinyinQuestion?> getQuestionByPinyin(String pinyin);
  
  /// 获取所有拼音
  Future<List<String>> getAllPinyin();
  
  /// 保存问题
  Future<void> saveQuestion(PinyinQuestion question);
  
  /// 删除问题
  Future<void> deleteQuestion(int index);
  
  /// 加载问题数据
  Future<void> loadQuestions();
} 