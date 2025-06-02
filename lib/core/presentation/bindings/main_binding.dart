import 'package:get/get.dart';
import '../controllers/main_controller.dart';

/// 主页面绑定
/// 负责注册主页面相关的依赖
class MainBinding extends Bindings {
  @override
  void dependencies() {
    // 控制器注入（延迟加载）
    Get.lazyPut<MainController>(
      () => MainController(),
    );
  }
} 