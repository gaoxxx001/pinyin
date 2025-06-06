import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:pinyin/data/repositories/question_repository.dart';
import 'package:pinyin/data/models/question_entity.dart';
import 'question_repository_test.mocks.dart';

// 生成 Mock 类
@GenerateMocks([Isar, IsarCollection])
void main() {
  late QuestionRepository repository;
  late Isar isar;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  setUp(() async {
    // 初始化真实的 Isar 实例
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [QuestionEntitySchema],
      directory: dir.path,
    );
    repository = QuestionRepository();
    repository.isar = isar;
  });

  tearDown(() async {
    await isar.close();
  });

  group('QuestionRepository Tests', () {
    test('保存和获取问题', () async {
      // 保存问题
      await repository.saveQuestion(
        emoji: '😃',
        pinyin: ['hā', 'hā'],
        pinyin3: ['ha1', 'ha1'],
        options: [
          ['fā', 'kā'],
          ['kā', 'hā'],
        ],
      );

      // 获取问题
      final questions = await repository.getAllQuestions();
      expect(questions.length, 1);
      expect(questions.first.emoji, '😃');
      expect(questions.first.pinyin, ['hā', 'hā']);
    });

    test('更新问题状态', () async {
      // 先保存一个问题
      await repository.saveQuestion(
        emoji: '😃',
        pinyin: ['hā', 'hā'],
        pinyin3: ['ha1', 'ha1'],
        options: [
          ['fā', 'kā'],
          ['kā', 'hā'],
        ],
      );

      // 获取问题
      final questions = await repository.getAllQuestions();
      final questionId = questions.first.id;

      // 更新状态
      await repository.updateQuestionCompletion(questionId, -1);

      // 验证更新
      final updatedQuestion = await repository.getQuestionById(questionId);
      expect(updatedQuestion?.completionCount, -1);
    });
  });
} 