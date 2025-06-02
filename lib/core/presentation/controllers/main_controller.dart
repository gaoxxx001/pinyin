import 'package:get/get.dart';
import '../../data/models/pinyin_question.dart';
import '../../data/providers/audio_provider.dart';
import '../../domain/repositories/question_repository.dart';

/// 主页面控制器
/// 负责管理拼音练习的核心逻辑
class MainController extends GetxController with StateMixin<List<PinyinQuestion>> {
  // 依赖注入
  final QuestionRepository _questionRepository = Get.find<QuestionRepository>();
  final AudioProvider _audioProvider = Get.find<AudioProvider>();
  
  // 响应式变量 - 只保留必要的
  final RxInt currentQuestionIndex = 0.obs;
  
  // 使用StateMixin替代手动的isLoading和errorMessage
  List<PinyinQuestion> get currentQuestions => state ?? [];

  // Getter 简化访问
  PinyinQuestion? get currentQuestion {
    if (currentQuestions.isEmpty || currentQuestionIndex.value >= currentQuestions.length) {
      return null;
    }
    return currentQuestions[currentQuestionIndex.value];
  }

  bool get hasCurrentQuestion => currentQuestion != null;
  bool get isPlaying => _audioProvider.isPlaying.value;

  @override
  void onInit() {
    super.onInit();
    loadQuestions();
  }

  /// 加载问题数据
  Future<void> loadQuestions() async {
    try {
      // 使用StateMixin的change方法管理状态
      change(null, status: RxStatus.loading());
      
      await _questionRepository.loadQuestions();
      await _loadNewQuestions();
    } catch (e) {
      // 错误状态
      change(null, status: RxStatus.error('加载问题失败：${e.toString()}'));
      _showErrorSnackbar('加载问题失败', e.toString());
    }
  }

  /// 加载新的问题集
  Future<void> _loadNewQuestions() async {
    try {
      final questions = await _questionRepository.getRandomQuestions(10);
      currentQuestionIndex.value = 0;
      
      // 成功状态
      change(questions, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error('加载新问题失败：${e.toString()}'));
      _showErrorSnackbar('加载新问题失败', e.toString());
    }
  }

  /// 播放当前问题的音频
  Future<void> playCurrentAudio() async {
    if (!hasCurrentQuestion) return;
    
    try {
      await _audioProvider.playAudio(currentQuestion!.audioPath);
    } catch (e) {
      _showErrorSnackbar('音频错误', '播放音频失败：${e.toString()}');
    }
  }

  /// 下一题
  Future<void> nextQuestion() async {
    if (currentQuestionIndex.value < currentQuestions.length - 1) {
      currentQuestionIndex.value++;
    } else {
      await _loadNewQuestions();
    }
  }

  /// 检查答案
  bool checkAnswer(String selectedPinyin) {
    if (!hasCurrentQuestion) return false;
    return selectedPinyin == currentQuestion!.pinyin;
  }

  /// 处理答案选择
  Future<void> handleAnswer(String selectedPinyin) async {
    if (!hasCurrentQuestion) return;

    final isCorrect = checkAnswer(selectedPinyin);
    
    if (isCorrect) {
      _showSuccessSnackbar();
      // 延迟一下再进入下一题
      await Future.delayed(const Duration(milliseconds: 500));
      await nextQuestion();
    } else {
      _showIncorrectSnackbar();
    }
  }

  /// 刷新问题
  Future<void> refreshQuestions() async {
    await loadQuestions();
  }

  /// 显示成功提示
  void _showSuccessSnackbar() {
    Get.snackbar(
      '正确',
      '太棒了！',
      backgroundColor: Get.theme.colorScheme.primary,
      colorText: Get.theme.colorScheme.onPrimary,
      duration: const Duration(seconds: 1),
      snackPosition: SnackPosition.TOP,
    );
  }

  /// 显示错误答案提示
  void _showIncorrectSnackbar() {
    Get.snackbar(
      '错误',
      '再试一次吧！正确答案是：${currentQuestion!.pinyin}',
      backgroundColor: Get.theme.colorScheme.error,
      colorText: Get.theme.colorScheme.onError,
      duration: const Duration(seconds: 2),
      snackPosition: SnackPosition.TOP,
    );
  }

  /// 显示错误提示
  void _showErrorSnackbar(String title, String message) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Get.theme.colorScheme.error,
      colorText: Get.theme.colorScheme.onError,
      snackPosition: SnackPosition.TOP,
    );
  }

  @override
  void onClose() {
    // 资源释放在各自的Provider中处理
    super.onClose();
  }
} 