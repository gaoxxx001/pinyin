// lib/presentation/controllers/question_practice_controller.dart
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinyin/data/models/emoji_question.dart';
import '../../../data/models/study_record.dart';
import '../../../data/repositories/emoji_question_repo.dart';
import '../../../data/repositories/study_record_repository.dart';

enum QuestionStatus { notAnswered, current, correct, wrong }
enum OptionStatus { normal, correct, wrong }

class PracticeController extends GetxController {
  late EmojiQuestionRepo _questionRepository;
  late StudyRecordRepository _studyRecordRepository;

  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;
  final RxList<EmojiQuestion> questions = <EmojiQuestion>[].obs;
  final RxInt currentIndex = 0.obs;
  final Rx<EmojiQuestion?> currentQuestion = Rx<EmojiQuestion?>(null);
  final RxList<String> currentOptions = <String>[].obs;
  final RxList<QuestionStatus> statusList = <QuestionStatus>[].obs;
  final RxInt correctCount = 0.obs;
  final RxInt wrongCount = 0.obs;
  final RxInt answeredCount = 0.obs;
  final RxInt elapsedSeconds = 0.obs;
  final RxString emoji = '🙂'.obs;
  Timer? _timer;
  final RxInt selectedOption = (-1).obs;

  @override
  void onInit() {
    super.onInit();
    _questionRepository = Get.find();
    _studyRecordRepository = Get.find();
    loadQuestions();
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  Future<void> loadQuestions() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      final list = await _questionRepository.getQuestions(20);
      questions.assignAll(list);
      print('questions: ${questions.length}');
      statusList.assignAll(List.generate(list.length, (i) => i == 0 ? QuestionStatus.current : QuestionStatus.notAnswered));
      currentIndex.value = 0;
      correctCount.value = 0;
      wrongCount.value = 0;
      answeredCount.value = 0;
      elapsedSeconds.value = 0;
      emoji.value = '🙂';
      _startTimer();
      _loadCurrent();
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      elapsedSeconds.value++;
    });
  }

  void _loadCurrent() {
    final q = questions[currentIndex.value];
    currentQuestion.value = q;
    currentOptions.assignAll(q.options..shuffle());
    selectedOption.value = -1;
  }

  OptionStatus getOptionStatus(int idx) {
    if (selectedOption.value == -1) return OptionStatus.normal;
    if (idx == selectedOption.value) {
      return currentOptions[idx] == currentQuestion.value?.answer
          ? OptionStatus.correct
          : OptionStatus.wrong;
    }
    if (currentOptions[idx] == currentQuestion.value?.answer) {
      return OptionStatus.correct;
    }
    return OptionStatus.normal;
  }

  void onOptionSelected(int idx) {
    if (selectedOption.value != -1) return;
    selectedOption.value = idx;
    answeredCount.value++;
    if (currentOptions[idx] == currentQuestion.value?.answer) {
      correctCount.value++;
      emoji.value = '😃';
      statusList[currentIndex.value] = QuestionStatus.correct;
    } else {
      wrongCount.value++;
      emoji.value = '😢';
      statusList[currentIndex.value] = QuestionStatus.wrong;
    }
    update();
    Future.delayed(const Duration(milliseconds: 1500), nextQuestion);
  }

  void nextQuestion() {
    if (currentIndex.value < questions.length - 1) {
      statusList[currentIndex.value] = statusList[currentIndex.value] == QuestionStatus.notAnswered
          ? QuestionStatus.current
          : statusList[currentIndex.value];
      currentIndex.value++;
      statusList[currentIndex.value] = QuestionStatus.current;
      selectedOption.value = -1;
      emoji.value = '🙂';
      _loadCurrent();
    } else {
      _timer?.cancel();
      _showResultDialog();
    }
  }

  void onExitPressed() {
    if (answeredCount.value < 10) {
      Get.defaultDialog(
        title: '提示',
        middleText: '做题未满10题，确定要退出吗？',
        textCancel: '继续做题',
        textConfirm: '退出',
        onConfirm: () {
          Get.back();
          Get.back();
        },
      );
    } else {
      _showResultDialog();
    }
  }

  void _showResultDialog() {
    Get.defaultDialog(
      title: '本次做题记录',
      content: Column(
        children: [
          Text('总题数：${questions.length}'),
          Text('已做题数：${answeredCount.value}'),
          Text('错题数：${wrongCount.value}'),
          Text('用时：${elapsedSeconds.value}秒'),
          Text('时间：${DateTime.now().toString().substring(0, 19)}'),
        ],
      ),
      textCancel: '继续做题',
      textConfirm: '保存记录',
      onConfirm: () async {
        await _saveRecord();
        Get.back();
        Get.back();
      },
    );
  }

  Future<void> _saveRecord() async {
    final record = StudyRecord(
      totalQuestions: answeredCount.value,
      wrongQuestions: wrongCount.value,
      totalTimeInSeconds: elapsedSeconds.value,
      studyTime: DateTime.now(),
    );
    await _studyRecordRepository.saveRecord(record);
  }

  bool get hasError => errorMessage.value.isNotEmpty;
}