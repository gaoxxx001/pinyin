import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/pinyin_question.dart';

class QuestionBankService {
  List<PinyinQuestion> _questions = [];
  
  Future<void> loadQuestions() async {
    try {
      final String jsonString = await rootBundle.loadString('assets/data/questions.json');
      final List<dynamic> jsonList = json.decode(jsonString);
      _questions = jsonList.map((json) => PinyinQuestion.fromJson(json)).toList();
    } catch (e) {
      print('Error loading questions: $e');
      _questions = [];
    }
  }

  List<PinyinQuestion> getRandomQuestions(int count) {
    if (_questions.isEmpty) return [];
    _questions.shuffle();
    return _questions.take(count).toList();
  }

  PinyinQuestion? getQuestionByPinyin(String pinyin) {
    try {
      return _questions.firstWhere((q) => q.pinyin == pinyin);
    } catch (e) {
      return null;
    }
  }

  List<String> getAllPinyin() {
    return _questions.map((q) => q.pinyin).toList();
  }
} 