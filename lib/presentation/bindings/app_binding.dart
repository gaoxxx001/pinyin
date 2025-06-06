import 'package:get/get.dart';
import '../../data/repositories/question_repository.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    // 初始化问题仓储
    Get.putAsync<QuestionRepository>(() async {
      final repository = QuestionRepository();
      return await repository.init();
    }, permanent: true);
  }
} 