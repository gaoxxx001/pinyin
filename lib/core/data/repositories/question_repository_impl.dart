import '../../domain/repositories/question_repository.dart';
import '../models/pinyin_question.dart';
import '../providers/storage_provider.dart';

/// 问题仓库实现
/// 实现问题相关的业务操作
class QuestionRepositoryImpl implements QuestionRepository {
  final StorageProvider _storageProvider;

  QuestionRepositoryImpl(this._storageProvider);

  @override
  Future<List<PinyinQuestion>> getAllQuestions() async {
    return _storageProvider.questions.toList();
  }

  @override
  Future<List<PinyinQuestion>> getRandomQuestions(int count) async {
    return _storageProvider.getRandomQuestions(count);
  }

  @override
  Future<PinyinQuestion?> getQuestionByPinyin(String pinyin) async {
    return _storageProvider.getQuestionByPinyin(pinyin);
  }

  @override
  Future<List<String>> getAllPinyin() async {
    return _storageProvider.getAllPinyin();
  }

  @override
  Future<void> saveQuestion(PinyinQuestion question) async {
    await _storageProvider.saveQuestion(question);
  }

  @override
  Future<void> deleteQuestion(int index) async {
    await _storageProvider.deleteQuestion(index);
  }

  @override
  Future<void> loadQuestions() async {
    await _storageProvider.loadQuestions();
  }
} 