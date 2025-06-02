import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/main_controller.dart';

/// 主页面
/// 拼音练习的主界面
class MainPage extends GetView<MainController> {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('拼音练习'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: controller.refreshQuestions,
            tooltip: '刷新题目',
          ),
        ],
      ),
      body: controller.obx(
        (questions) => _buildQuestionContent(),
        onLoading: _buildLoadingState(),
        onError: (error) => _buildErrorState(error),
        onEmpty: _buildEmptyState(),
      ),
    );
  }

  /// 构建加载状态
  Widget _buildLoadingState() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 16),
          Text('正在加载题目...'),
        ],
      ),
    );
  }

  /// 构建错误状态
  Widget _buildErrorState(String? error) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 64,
              color: Colors.red,
            ),
            const SizedBox(height: 16),
            Text(
              error ?? '加载失败',
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: controller.refreshQuestions,
              child: const Text('重试'),
            ),
          ],
        ),
      ),
    );
  }

  /// 构建空状态
  Widget _buildEmptyState() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.quiz_outlined,
            size: 64,
            color: Colors.grey,
          ),
          SizedBox(height: 16),
          Text(
            '暂无题目',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  /// 构建题目内容
  Widget _buildQuestionContent() {
    if (!controller.hasCurrentQuestion) {
      return _buildEmptyState();
    }

    final question = controller.currentQuestion!;
    
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // 题目进度指示器
          _buildProgressIndicator(),
          
          // 主要内容区域
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Emoji 显示
                _buildEmojiDisplay(question.emoji),            
                // 选项按钮
                _buildOptionsGrid(question.options),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 构建进度指示器
  Widget _buildProgressIndicator() {
    return Obx(() => Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '第 ${controller.currentQuestionIndex.value + 1} 题',
            style: Get.textTheme.titleMedium?.copyWith(
              color: Get.theme.colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            '/ ${controller.currentQuestions.length}',
            style: Get.textTheme.titleMedium?.copyWith(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    ));
  }

  /// 构建Emoji显示
  Widget _buildEmojiDisplay(String emoji) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Get.theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        emoji,
        style: const TextStyle(fontSize: 64),
      ),
    );
  }

  /// 构建播放按钮
  Widget _buildPlayButton() {
    return Container(
      decoration: BoxDecoration(
        color: Get.theme.colorScheme.primary,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Get.theme.colorScheme.primary.withValues(alpha: 0.3),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: IconButton(
        icon: Obx(() => Icon(
          controller.isPlaying ? Icons.pause : Icons.play_arrow,
          size: 40,
          color: Get.theme.colorScheme.onPrimary,
        )),
        onPressed: controller.playCurrentAudio,
        tooltip: '播放发音',
      ),
    );
  }

  /// 构建选项网格
  Widget _buildOptionsGrid(List<String> options) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 2.5,
      ),
      itemCount: options.length,
      itemBuilder: (context, index) {
        final option = options[index];
        return _buildOptionButton(option);
      },
    );
  }

  /// 构建选项按钮
  Widget _buildOptionButton(String option) {
    return ElevatedButton(
      onPressed: () => controller.handleAnswer(option),
      style: ElevatedButton.styleFrom(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
      child: Text(
        option,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
} 