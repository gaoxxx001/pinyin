import 'package:get/get.dart';
import 'package:pinyin/services/isar_service.dart';
import 'package:pinyin/data/repositories/emoji_question_repo.dart';
import 'package:pinyin/data/repositories/study_record_repository.dart';
import 'package:pinyin/data/providers/question_entity_provider.dart';
import 'package:pinyin/data/providers/study_record_provider.dart';


class AppBinding extends Bindings {
  @override
  void dependencies() {
    // 初始化问题仓储
    Get.put(QuestionEntityProvider(),permanent: true);
    Get.put(StudyRecordProvider(),permanent: true);
    Get.put(EmojiQuestionRepo(),permanent: true);
    Get.put(StudyRecordRepository(),permanent: true);
    print('AppBinding init');
  }
} 