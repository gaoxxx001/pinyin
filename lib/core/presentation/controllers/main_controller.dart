import 'package:get/get.dart';
import '../../domain/models/pinyin_question.dart';
import '../../domain/services/question_bank_service.dart';
import '../../domain/services/audio_service.dart';

class MainController extends GetxController {
  final QuestionBankService _questionBankService = QuestionBankService();
  final AudioService _audioService = AudioService();
  
  final RxList<PinyinQuestion> currentQuestions = <PinyinQuestion>[].obs;
  final RxInt currentQuestionIndex = 0.obs;
  final RxBool isLoading = true.obs;
  final RxBool isPlaying = false.obs;

  @override
  void onInit() {
    super.onInit();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    isLoading.value = true;
    await _questionBankService.loadQuestions();
    _loadNewQuestions();
    isLoading.value = false;
  }

  void _loadNewQuestions() {
    currentQuestions.value = _questionBankService.getRandomQuestions(10);
    currentQuestionIndex.value = 0;
  }

  PinyinQuestion get currentQuestion => currentQuestions[currentQuestionIndex.value];

  Future<void> playCurrentAudio() async {
    isPlaying.value = true;
    await _audioService.playAudio(currentQuestion.audioPath);
    isPlaying.value = false;
  }

  void nextQuestion() {
    if (currentQuestionIndex.value < currentQuestions.length - 1) {
      currentQuestionIndex.value++;
    } else {
      _loadNewQuestions();
    }
  }

  bool checkAnswer(String selectedPinyin) {
    return selectedPinyin == currentQuestion.pinyin;
  }

  @override
  void onClose() {
    _audioService.dispose();
    super.onClose();
  }
} 