import 'package:get/get.dart';
import '../../data/repositories/question_repository.dart';

class TestController extends GetxController {
  final QuestionRepository _repository = Get.find<QuestionRepository>();
  
  // 测试数据
  final testQuestion = {
    'emoji': '��',
    'pinyin': ['hā', 'hā'],
    'pinyin3': ['ha1', 'ha1'],
    'options': [
      ['fā', 'kā'],
      ['kā', 'hā'],
      ['kē', 'kē'],
    ],
  };
  
  // 测试保存单个问题
  Future<void> testSaveQuestion() async {
    try {
      await _repository.saveQuestion(
        emoji: testQuestion['emoji'] as String,
        pinyin: testQuestion['pinyin'] as List<String>,
        pinyin3: testQuestion['pinyin3'] as List<String>,
        options: testQuestion['options'] as List<List<String>>,
      );
      print('保存问题成功');
    } catch (e) {
      print('保存问题失败: $e');
    }
  }
  
  // 测试查询所有问题
  Future<void> testGetAllQuestions() async {
    try {
      final questions = await _repository.getAllQuestions();
      print('查询到 ${questions.length} 个问题');
      for (var q in questions) {
        print('问题: ${q.emoji}, 完成次数: ${q.completionCount}');
        print('选项: ${q.getOptionsAsPairs()}');
      }
    } catch (e) {
      print('查询问题失败: $e');
    }
  }
  
  // 测试更新问题状态
  Future<void> testUpdateQuestion() async {
    try {
      final questions = await _repository.getAllQuestions();
      if (questions.isNotEmpty) {
        await _repository.updateQuestionCompletion(questions.first.id, -1);
        print('更新问题状态成功');
      }
    } catch (e) {
      print('更新问题状态失败: $e');
    }
  }
}
