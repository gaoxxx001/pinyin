import '../entities/question_Entity.dart';

abstract class QuestionEntityRepository {
  Future<List<QuestionEntity>> getQuestions();
  Future<QuestionEntity> getQuestion(int id);
  Future<void> addQuestion(QuestionEntity question);
  Future<void> updateQuestion(QuestionEntity question);
  Future<void> deleteQuestion(int id);
}
