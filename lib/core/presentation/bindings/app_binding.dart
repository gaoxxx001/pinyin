import 'package:get/get.dart';
import '../../data/providers/audio_provider.dart';
import '../../data/providers/storage_provider.dart';
import '../../data/repositories/question_repository_impl.dart';
import '../../domain/repositories/question_repository.dart';

/// 全局应用绑定
/// 负责注册全局服务和依赖
class AppBinding extends Bindings {
  @override
  void dependencies() {
    // 全局服务注册（持久化）
    Get.put<StorageProvider>(
      StorageProvider(),
      permanent: true,
    );
    
    Get.put<AudioProvider>(
      AudioProvider(),
      permanent: true,
    );

    // 仓库注册（单例）
    Get.lazyPut<QuestionRepository>(
      () => QuestionRepositoryImpl(
        Get.find<StorageProvider>(),
      ),
      fenix: true,
    );
  }
} 