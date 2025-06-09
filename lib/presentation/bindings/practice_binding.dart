import 'package:get/get.dart';
import '../controllers/practice_controller.dart';

class PracticeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuestionRepository>(() => QuestionRepositoryImpl());
    Get.lazyPut<StudyRecordRepository>(() => StudyRecordRepositoryImpl());
    Get.lazyPut<QuestionPracticeController>(() => QuestionPracticeController());
  }
} 