import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../models/question_entity.dart';

class QuestionRepository extends GetxService {
  late Isar _isar;
  
  // 获取 Isar 实例
  Isar get isar => _isar;
  
  // 初始化数据库
  Future<QuestionRepository> init() async {
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      [QuestionEntitySchema],
      directory: dir.path,
    );
    return this;
  }
  
  // 关闭数据库
  Future<void> close() async {
    await _isar.close();
  }
  
  // 保存问题，支持直接传入选项对
  Future<void> saveQuestion({
    required String emoji,
    required List<String> pinyin,
    required List<String> pinyin3,
    required List<List<String>> options,
    int completionCount = 0,
  }) async {
    final question = QuestionEntity(
      emoji: emoji,
      pinyin: pinyin,
      pinyin3: pinyin3,
      options: [], // 临时空列表
      completionCount: completionCount,
    );
    
    // 设置选项
    question.setOptionsFromPairs(options);
    
    await _isar.writeTxn(() async {
      await _isar.collection<QuestionEntity>().put(question);
    });
  }
  
  // 批量保存问题
  Future<void> saveQuestions(List<Map<String, dynamic>> questionsData) async {
    await _isar.writeTxn(() async {
      for (final data in questionsData) {
        final question = QuestionEntity(
          emoji: data['emoji'],
          pinyin: List<String>.from(data['pinyin']),
          pinyin3: List<String>.from(data['pinyin3']),
          options: [], // 临时空列表
          completionCount: 0,
        );
        
        // 设置选项
        question.setOptionsFromPairs(
          List<List<String>>.from(data['options']),
        );
        
        await _isar.collection<QuestionEntity>().put(question);
      }
    });
  }
  Future<List<QuestionEntity>> getAllQuestions() async {
    return await _isar.collection<QuestionEntity>().where().findAll();
  }
  
  Future<QuestionEntity?> getQuestionById(int id) async {
    return await _isar.collection<QuestionEntity>().get(id);
  }
  
  Future<void> updateQuestionCompletion(int id, int completionCount) async {
    final question = await getQuestionById(id);
    if (question != null) {
      question.completionCount = completionCount;
      await _isar.writeTxn(() async {
        await _isar.collection<QuestionEntity>().put(question);
      });
    }
  }
  
  // 获取未完成的问题
  Future<List<QuestionEntity>> getUncompletedQuestions() async {
    return await _isar.collection<QuestionEntity>()
        .where()
        .completionCountEqualTo(0)
        .findAll();
  }
  
  // 获取错误的问题
  Future<List<QuestionEntity>> getErrorQuestions() async {
    return await _isar.collection<QuestionEntity>()
        .where()
        .completionCountEqualTo(-1)
        .findAll();
  }
  
  // 获取已完成的问题
  Future<List<QuestionEntity>> getCompletedQuestions() async {
    return await _isar.collection<QuestionEntity>()
        .where()
        .completionCountGreaterThan(0)
        .findAll();
  }
}
