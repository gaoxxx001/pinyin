import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/domain/models/pinyin_question.dart';
import 'core/presentation/pages/main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // 初始化 Hive
  await Hive.initFlutter();
  Hive.registerAdapter(PinyinQuestionAdapter());
  await Hive.openBox<PinyinQuestion>('questions');
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '拼音练习',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainPage(),
    );
  }
}
