import 'package:get/get.dart';
import 'package:pinyin/presentation/bindings/settings_binding.dart';
import 'package:pinyin/presentation/bindings/statistics_binding.dart';
import 'package:pinyin/presentation/pages/settings_page.dart';
import 'package:pinyin/presentation/pages/statistics_page.dart';
import '../presentation/pages/practice_page.dart';
import '../presentation/pages/home_page.dart';
import '../presentation/bindings/practice_binding.dart';
import '../presentation/bindings/home_binding.dart';
import 'app_routes.dart';

/// 应用页面路由配置
class AppPages {
  // 防止实例化
  AppPages._();

  /// 初始路由

  /// 路由页面列表
  static final List<GetPage> pages = [
    GetPage(
      name: Routes.HOME,
      page: () => const HomePage(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: Routes.PRACTICE,
      page: () => const PracticePage(),
      binding: PracticeBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
      GetPage(
        name: Routes.SETTINGS,
        page: () => const SettingsPage(),
        binding: SettingsBinding(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 300),
      ),
    GetPage(
      name: Routes.STATISTICS,
      page: () => const StatisticsPage(),
      binding: StatisticsBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
  ];
}



