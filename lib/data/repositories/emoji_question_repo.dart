import 'package:get/get.dart';
import 'package:pinyin/data/models/emoji_question.dart';
import 'package:pinyin/data/providers/question_entity_provider.dart';


class EmojiQuestionRepo extends GetxService {
  late QuestionEntityProvider questionEntityProvider;

  @override
  void onInit() {
    super.onInit();
    questionEntityProvider = Get.find<QuestionEntityProvider>();
  }

  Future<List<EmojiQuestion>> getQuestions(int count) async {
    var errorQ = await questionEntityProvider.getLeastCompletedQuestions(count~/2);
    var uncompletedQ = await questionEntityProvider.getUncompletedQuestions(count - errorQ.length);
    if (errorQ.length + uncompletedQ.length < count) {
      var completedQ = await questionEntityProvider.getLeastCompletedQuestions(count - errorQ.length - uncompletedQ.length);
      errorQ.addAll(completedQ);
      return (errorQ+uncompletedQ+completedQ).map((e) => EmojiQuestion.fromEntity(e)).toList();
    }
    var qs = (errorQ+uncompletedQ).map((e) => EmojiQuestion.fromEntity(e)).toList();
    qs.shuffle();
    return qs;
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