import 'dart:io';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:pinyin/data/models/question_entity.dart';
import 'package:pinyin/data/models/study_record.dart';

class IsarService extends GetxService {
  late Isar isar;
  bool _isInitialized = false;
  static const String _dbName = 'pinyin_database.isar';

  /// 初始化 Isar 数据库
  Future<IsarService> init() async {
    if (_isInitialized) return this;

    try {
      final dir = await getApplicationDocumentsDirectory();
      final dbPath = path.join(dir.path, _dbName);
      
      // 检查数据库文件是否存在
      if (!await File(dbPath).exists()) {
        // 从 assets 复制初始数据
        await _copyInitialData(dbPath);
      }

      isar = await Isar.open(
        [QuestionEntitySchema,StudyRecordSchema],
        directory: dir.path,
        name: 'pinyin_database',
      );
      _isInitialized = true;
    } catch (e) {
      print('Isar initialization failed: $e');
      rethrow;
    }

    return this;
  }

  /// 从 assets 复制初始数据
  Future<void> _copyInitialData(String targetPath) async {
    try {
      // 读取 assets 中的文件
      final data = await rootBundle.load('assets/data/questions.isar');
      final bytes = data.buffer.asUint8List();
      
      // 写入目标路径
      final file = File(targetPath);
      await file.writeAsBytes(bytes);
      
      print('Initial database copied successfully');
    } catch (e) {
      print('Failed to copy initial database: $e');
      rethrow;
    }
  }

  /// 测试环境初始化
  Future<IsarService> test() async {
    if (_isInitialized) return this;

    try {
      isar = await Isar.open(
        [QuestionEntitySchema,StudyRecordSchema],
        directory: '',
        name: 'test_database',
      );
      _isInitialized = true;
    } catch (e) {
      print('Isar test initialization failed: $e');
      rethrow;
    }

    return this;
  }

  /// 关闭数据库连接
  Future<void> close() async {
    if (_isInitialized) {
      await isar.close();
      _isInitialized = false;
    }
  }

  /// 清理数据库
  Future<void> clear() async {
    if (_isInitialized) {
      await isar.writeTxn(() async {
        await isar.clear();
      });
    }
  }

  /// 检查是否已初始化
  bool get isInitialized => _isInitialized;
}