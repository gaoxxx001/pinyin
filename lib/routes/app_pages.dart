import 'package:get/get.dart';
import '../core/presentation/pages/main_page.dart';
import '../core/presentation/bindings/main_binding.dart';
import 'app_routes.dart';

/// 应用页面路由配置
class AppPages {
  // 防止实例化
  AppPages._();

  /// 初始路由
  static const String INITIAL = Routes.MAIN;

  /// 路由页面列表
  static final List<GetPage> pages = [
    GetPage(
      name: Routes.MAIN,
      page: () => const MainPage(),
      binding: MainBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
  ];
} 