import 'package:pinyin/data/models/emoji_question.dart';
import 'package:pinyin/data/providers/question_entity_provider.dart';


class EmojiQuestionRepo {
  late QuestionEntityProvider questionEntityProvider;

  EmojiQuestionRepo(this.questionEntityProvider);

  Future<List<EmojiQuestion>> getQuestions(int count) async {
    var errorQ = await questionEntityProvider.getLeastCompletedQuestions(count~/2);
    var uncompletedQ = await questionEntityProvider.getUncompletedQuestions(count - errorQ.length);
    if (errorQ.length + uncompletedQ.length < count) {
      var completedQ = await questionEntityProvider.getLeastCompletedQuestions(count - errorQ.length - uncompletedQ.length);
      errorQ.addAll(completedQ);
      return (errorQ+uncompletedQ+completedQ).map((e) => EmojiQuestion.fromEntity(e)).toList();
    }
    return (errorQ+uncompletedQ).map((e) => EmojiQuestion.fromEntity(e)).toList();
  }

  Future<void> updateQuestion(EmojiQuestion question,bool isError) async {
    var entity = await questionEntityProvider.getQuestionById(question.id);
    if (entity == null) {
      return;
    }
    if (isError) {
      entity.completionCount = -1;
      await questionEntityProvider.saveQuestion(entity);
    } else {
      entity.completionCount += 1;
      await questionEntityProvider.saveQuestion(entity);
    }
  }
}