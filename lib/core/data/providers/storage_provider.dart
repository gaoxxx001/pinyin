import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../models/pinyin_question.dart';

/// 存储提供者
/// 负责处理数据存储和加载功能
class StorageProvider extends GetxService {
  late Box<PinyinQuestion> _questionsBox;
  
  // 使用普通List，只在必要时使用响应式
  List<PinyinQuestion> _questions = [];
  bool _isInitialized = false;

  List<PinyinQuestion> get questions => List.unmodifiable(_questions);
  bool get isInitialized => _isInitialized;

  @override
  void onInit() {
    super.onInit();
    _questionsBox = Hive.box<PinyinQuestion>('questions');
    loadQuestions();
  }

  /// 加载问题数据
  Future<void> loadQuestions() async {
    try {
      // 先尝试从本地缓存加载
      final cachedQuestions = _questionsBox.values.toList();
      if (cachedQuestions.isNotEmpty) {
        _questions = cachedQuestions;
        _isInitialized = true;
        return;
      }

      // 从assets加载
      final String jsonString = await rootBundle.loadString('assets/data/questions.json');
      final List<dynamic> jsonList = json.decode(jsonString);
      final List<PinyinQuestion> loadedQuestions = jsonList
          .map((json) => PinyinQuestion.fromJson(json))
          .toList();

      // 保存到本地缓存
      await _questionsBox.clear();
      for (final question in loadedQuestions) {
        await _questionsBox.add(question);
      }

      _questions = loadedQuestions;
      _isInitialized = true;
    } catch (e) {
      _showErrorSnackbar('加载错误', '加载问题数据失败：${e.toString()}');
      _questions = [];
      _isInitialized = false;
    }
  }

  /// 获取随机问题
  List<PinyinQuestion> getRandomQuestions(int count) {
    if (_questions.isEmpty) return [];
    final shuffledQuestions = List<PinyinQuestion>.from(_questions);
    shuffledQuestions.shuffle();
    return shuffledQuestions.take(count).toList();
  }

  /// 根据拼音获取问题
  PinyinQuestion? getQuestionByPinyin(String pinyin) {
    try {
      return _questions.firstWhere((q) => q.pinyin == pinyin);
    } catch (e) {
      return null;
    }
  }

  /// 获取所有拼音
  List<String> getAllPinyin() {
    return _questions.map((q) => q.pinyin).toList();
  }

  /// 保存问题到本地
  Future<void> saveQuestion(PinyinQuestion question) async {
    try {
      await _questionsBox.add(question);
      _questions.add(question);
    } catch (e) {
      _showErrorSnackbar('保存错误', '保存问题失败：${e.toString()}');
    }
  }

  /// 删除问题
  Future<void> deleteQuestion(int index) async {
    try {
      if (index >= 0 && index < _questions.length) {
        await _questionsBox.deleteAt(index);
        _questions.removeAt(index);
      }
    } catch (e) {
      _showErrorSnackbar('删除错误', '删除问题失败：${e.toString()}');
    }
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
} 