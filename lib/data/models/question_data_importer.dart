import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pinyin/data/models/question_entity.dart';

class QuestionDataImporter {
  final Isar isar;

  QuestionDataImporter(this.isar);

  /// 从 JSON 文件导入数据
  Future<void> importFromJson(String jsonPath) async {
    try {
      // 读取 JSON 文件
      final jsonString = await rootBundle.loadString(jsonPath);
      final List<dynamic> jsonList = json.decode(jsonString);

      // 转换为 QuestionEntity 对象
      final questions = jsonList.map((json) {
        return QuestionEntity(
          emoji: json['emoji'] as String,
          pinyin: List<String>.from(json['pinyin']),
          pinyin3: List<String>.from(json['pinyin3']),
          options: (json['options'] as List)
              .map((e) => (e as List).join(' '))
              .toList(),
          completionCount: 0,
        );
      }).toList();

      // 保存到 Isar 数据库
      await isar.writeTxn(() async {
        await isar.collection<QuestionEntity>().putAll(questions);
      });

      print('成功导入 ${questions.length} 个问题');
    } catch (e) {
      print('导入失败: $e');
      rethrow;
    }
  }
}



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
  // 确保目录存在
  await Directory(dir.path).create(recursive: true);

  final isar = await Isar.open([QuestionEntitySchema], directory: dir.path, name: 'questions');
  final importer = QuestionDataImporter(isar);

  // try {
  //   await importer.importFromJson('assets/data/output_question.json');
  // } catch (e) {
  //   print('导入失败: $e');
  // }
  var xs = await isar.collection<QuestionEntity>().where().findAll();
  for (var x in xs) {
    print(x.emoji);
  }
}

