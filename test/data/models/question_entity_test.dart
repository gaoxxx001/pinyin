import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:pinyin/data/models/question_entity.dart';

void main() {
  late Isar isar;

  setUpAll(() async {
    // 初始化测试环境
    await Isar.initializeIsarCore(download: true);
    // 打开内存数据库
    isar = await Isar.open(
      [QuestionEntitySchema],
      directory: '', // 使用空字符串表示内存数据库
    );
  });

  tearDownAll(() async {
    // 清理数据库
    await isar.writeTxn(() => isar.clear());
    await isar.close();
  });

  // 添加 setUp 在每个测试前清理数据库
  setUp(() async {
    await isar.writeTxn(() => isar.clear());
  });

  group('QuestionEntity Isar Tests', () {
    test('保存和读取问题', () async {
      final question = QuestionEntity(
        emoji: '😃',
        pinyin: ['hā', 'hā'],
        pinyin3: ['ha1', 'ha1'],
        options: ['fā,kā', 'kā,hā'],
        completionCount: 0,
      );

      // 保存问题
      await isar.writeTxn(() async {
        await isar.collection<QuestionEntity>().put(question);
      });

      // 读取问题
      final savedQuestion = await isar.collection<QuestionEntity>().get(question.id);
      expect(savedQuestion, isNotNull);
      expect(savedQuestion?.emoji, equals('😃'));
      expect(savedQuestion?.pinyin, equals(['hā', 'hā']));
      expect(savedQuestion?.pinyin3, equals(['ha1', 'ha1']));
      expect(savedQuestion?.options, equals(['fā,kā', 'kā,hā']));
      expect(savedQuestion?.completionCount, equals(0));
    });

    test('更新问题', () async {
      final question = QuestionEntity(
        emoji: '😃',
        pinyin: ['hā', 'hā'],
        pinyin3: ['ha1', 'ha1'],
        options: ['fā,kā'],
        completionCount: 0,
      );

      // 保存问题
      await isar.writeTxn(() async {
        await isar.collection<QuestionEntity>().put(question);
      });

      // 更新问题
      question.completionCount = 1;
      await isar.writeTxn(() async {
        await isar.collection<QuestionEntity>().put(question);
      });

      // 验证更新
      final updatedQuestion = await isar.collection<QuestionEntity>().get(question.id);
      expect(updatedQuestion?.completionCount, equals(1));
    });

    test('查询问题', () async {
      // 创建测试数据
      final questions = [
        QuestionEntity(
          emoji: '😃',
          pinyin: ['hā', 'hā'],
          pinyin3: ['ha1', 'ha1'],
          options: ['fā,kā'],
          completionCount: 0,
        ),
        QuestionEntity(
          emoji: '😢',
          pinyin: ['kū', 'kū'],
          pinyin3: ['ku1', 'ku1'],
          options: ['kū,hū'],
          completionCount: 1,
        ),
      ];

      // 保存问题
      await isar.writeTxn(() async {
        for (var question in questions) {
          await isar.collection<QuestionEntity>().put(question);
        }
      });

      // 查询所有问题
      final allQuestions = await isar.collection<QuestionEntity>().where().findAll();
      expect(allQuestions.length, equals(2));

      // 查询已完成的问题
      final completedQuestions = await isar.collection<QuestionEntity>()
          .where()
          .completionCountGreaterThan(0)
          .findAll();
      expect(completedQuestions.length, equals(1));
      expect(completedQuestions[0].emoji, equals('😢'));
    });

    test('删除问题', () async {
      final question = QuestionEntity(
        emoji: '😃',
        pinyin: ['hā', 'hā'],
        pinyin3: ['ha1', 'ha1'],
        options: ['fā,kā'],
        completionCount: 0,
      );

      // 保存问题
      await isar.writeTxn(() async {
        await isar.collection<QuestionEntity>().put(question);
      });

      // 删除问题
      await isar.writeTxn(() async {
        await isar.collection<QuestionEntity>().delete(question.id);
      });

      // 验证删除
      final deletedQuestion = await isar.collection<QuestionEntity>().get(question.id);
      expect(deletedQuestion, isNull);
    });
  });
} 