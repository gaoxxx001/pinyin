// lib/presentation/pages/question_practice_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/practice_controller.dart';

class PracticePage extends GetView<PracticeController> {
  const PracticePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('做题练习'),
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: controller.onExitPressed,
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.hasError) {
          return Center(
            child: Text(controller.errorMessage.value, style: const TextStyle(color: Colors.red)),
          );
        }
        return Column(
          children: [
            // 状态格子
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              child: _buildStatusGrid(),
            ),
            // 用时和 Emoji
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(() => Text('⏱️ ${controller.elapsedSeconds.value}s', style: const TextStyle(fontSize: 16))),
                  const SizedBox(width: 16),
                  Obx(() => Text(controller.emoji.value, style: const TextStyle(fontSize: 24))),
                ],
              ),
            ),
            // 题干
            Padding(
              padding: const EdgeInsets.all(16),
              child: Obx(() => Text(
                controller.currentQuestion.value?.content ?? '',
                style: const TextStyle(fontSize: 18),
              )),
            ),
            // 选项
            Expanded(
              child: Obx(() => ListView.builder(
                itemCount: controller.currentOptions.length,
                itemBuilder: (context, idx) {
                  final option = controller.currentOptions[idx];
                  final status = controller.getOptionStatus(idx);
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: status == OptionStatus.normal
                            ? null
                            : status == OptionStatus.correct
                                ? Colors.green
                                : Colors.red,
                      ),
                      onPressed: status == OptionStatus.normal
                          ? () => controller.onOptionSelected(idx)
                          : null,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(option, style: const TextStyle(fontSize: 16)),
                      ),
                    ),
                  );
                },
              )),
            ),
          ],
        );
      }),
    );
  }

  Widget _buildStatusGrid() {
    return Obx(() {
      final statusList = controller.statusList;
      final count = statusList.length;
      final width = MediaQuery.of(Get.context!).size.width;
      final gridSize = (width - 16) / count.clamp(1, 10); // 最多10格自适应
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(count, (i) {
          final status = statusList[i];
          Color color;
          switch (status) {
            case QuestionStatus.correct:
              color = Colors.green;
              break;
            case QuestionStatus.wrong:
              color = Colors.red;
              break;
            case QuestionStatus.current:
              color = Colors.blue;
              break;
            default:
              color = Colors.grey;
          }
          return Container(
            width: gridSize,
            height: gridSize,
            margin: const EdgeInsets.symmetric(horizontal: 2),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(4),
            ),
          );
        }),
      );
    });
  }
}