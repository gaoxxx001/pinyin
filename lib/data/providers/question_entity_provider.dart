import 'package:isar/isar.dart';
import 'package:pinyin/data/models/question_entity.dart';

class QuestionEntityProvider {
  final Isar _isar;

  QuestionEntityProvider(this._isar);

  /// 获取指定最大错误回答次数的问题
  /// [maxErrorCount] 最大错误次数
  Future<List<QuestionEntity>> getQuestionsWithMaxErrors(int maxErrorCount) async {
    return await _isar.collection<QuestionEntity>()
        .where()
        .completionCountEqualTo(-1)  // 错误回答
        .limit(maxErrorCount)
        .findAll();
  }

  /// 获取指定数量的未做题
  /// [count] 需要获取的未做题数量
  Future<List<QuestionEntity>> getUncompletedQuestions(int count) async {
    return await _isar.collection<QuestionEntity>()
        .where()
        .completionCountEqualTo(0)  // 未完成
        .limit(count)
        .findAll();
  }

  /// 获取做题次数最小的前 N 个问题
  /// [count] 需要获取的问题数量
  Future<List<QuestionEntity>> getLeastCompletedQuestions(int count) async {
    return await _isar.collection<QuestionEntity>()
        .where()
        .sortByCompletionCount()  // 按完成次数排序
        .limit(count)
        .findAll();
  }

  /// 获取所有问题
  Future<List<QuestionEntity>> getAllQuestions() async {
    return await _isar.collection<QuestionEntity>()
        .where()
        .findAll();
  }

  /// 保存问题
  Future<void> saveQuestion(QuestionEntity question) async {
    await _isar.writeTxn(() async {
      await _isar.collection<QuestionEntity>().put(question);
    });
  }

  /// 批量保存问题
  Future<void> saveQuestions(List<QuestionEntity> questions) async {
    await _isar.writeTxn(() async {
      await _isar.collection<QuestionEntity>().putAll(questions);
    });
  }

  /// 更新问题的完成状态
  Future<void> updateQuestionCompletion(QuestionEntity question, bool isCorrect) async {
    question.completionCount = isCorrect ? 1 : -1;
    await saveQuestion(question);
  }

  /// 增加问题的完成次数
  Future<void> incrementQuestionCompletion(QuestionEntity question) async {
    if (question.completionCount >= 0) {
      question.completionCount++;
      await saveQuestion(question);
    }
  }

  /// 重置问题的完成状态
  Future<void> resetQuestionCompletion(QuestionEntity question) async {
    question.completionCount = 0;
    await saveQuestion(question);
  }

  /// 删除问题
  Future<void> deleteQuestion(QuestionEntity question) async {
    await _isar.writeTxn(() async {
      await _isar.collection<QuestionEntity>().delete(question.id);
    });
  }

  /// 清空所有问题
  Future<void> clearAllQuestions() async {
    await _isar.writeTxn(() async {
      await _isar.collection<QuestionEntity>().clear();
    });
  }

  ///获取指定id的问题
  Future<QuestionEntity?> getQuestionById(int id) async {
    return await _isar.collection<QuestionEntity>().filter().idEqualTo(id).findFirst();
  }
}
