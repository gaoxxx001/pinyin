import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinyin/presentation/bindings/app_binding.dart';
import 'package:pinyin/routes/app_pages.dart';
import 'test_question_repo.dart';

class TestPage extends StatelessWidget {
  final TestController controller = Get.put(TestController());
  
  TestPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('数据库测试')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: controller.testSaveQuestion,
              child: const Text('测试保存问题'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: controller.testGetAllQuestions,
              child: const Text('测试查询问题'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: controller.testUpdateQuestion,
              child: const Text('测试更新问题'),
            ),
          ],
        ),
      ),
    );
  }
}


