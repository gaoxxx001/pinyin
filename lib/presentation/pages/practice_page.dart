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
                ],
              ),
            ),
            // 题干
            Padding(
              padding: const EdgeInsets.all(16),
              child: Obx(() => Text(
                controller.currentQuestion.value?.emoji ?? '',
                style: const TextStyle(fontSize: 112),
              )),
            ),
            // 选项
            Expanded(
              child: Obx(() => Column(
                children: List.generate(controller.currentOptions.length, (idx) {
                  final option = controller.currentOptions[idx];
                  final status = controller.getOptionStatus(idx);
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        side: WidgetStateProperty.all(
                          status == OptionStatus.normal
                              ? const BorderSide(color: Colors.transparent, width: 2)
                              : status == OptionStatus.correct
                                  ? const BorderSide(color: Colors.green, width: 2)
                                  : const BorderSide(color: Colors.red, width: 2),
                        ),
                      ),
                      onPressed: status == OptionStatus.normal
                          ? () => controller.onOptionSelected(idx)
                          : null,
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(option, style: const TextStyle(fontSize: 24)),
                      ),
                    ),
                  );
                }),
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
      
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 2,
        children: List.generate(count, (i) {
          final status = statusList[i];
          Color color;
          switch (status) {
            case QuestionStatus.correct:
              color = Colors.green.withAlpha(150);
              break;
            case QuestionStatus.wrong:
              color = Colors.red.withAlpha(150);
              break;
            case QuestionStatus.current:
              color = Colors.blue.withAlpha(220);
              break;
            default:
              color = Colors.grey.withAlpha(150);
          }
          return Expanded(
            child: Container(
              height: 4,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          );
        }),
      );
    });
  }
}