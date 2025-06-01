import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/main_controller.dart';

class MainPage extends StatelessWidget {
  final MainController controller = Get.put(MainController());

  MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('拼音练习'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final question = controller.currentQuestion;
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Emoji 显示
              Text(
                question.emoji,
                style: const TextStyle(fontSize: 64),
              ),
              const SizedBox(height: 32),
              
              // 播放按钮
              IconButton(
                icon: Icon(
                  controller.isPlaying.value ? Icons.pause : Icons.play_arrow,
                  size: 48,
                ),
                onPressed: controller.playCurrentAudio,
              ),
              const SizedBox(height: 32),
              
              // 选项按钮
              Wrap(
                spacing: 8,
                runSpacing: 8,
                alignment: WrapAlignment.center,
                children: question.options.map((option) {
                  return ElevatedButton(
                    onPressed: () {
                      if (controller.checkAnswer(option)) {
                        Get.snackbar(
                          '正确',
                          '太棒了！',
                          backgroundColor: Colors.green,
                          colorText: Colors.white,
                        );
                        controller.nextQuestion();
                      } else {
                        Get.snackbar(
                          '错误',
                          '再试一次吧！',
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                        );
                      }
                    },
                    child: Text(
                      option,
                      style: const TextStyle(fontSize: 24),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        );
      }),
    );
  }
} 