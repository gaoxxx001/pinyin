import 'package:isar/isar.dart';
import 'package:pinyin/data/models/study_record.dart';
import 'package:get/get.dart';
import 'package:pinyin/services/isar_service.dart';


class StudyRecordProvider extends GetxService {
  late Isar _isar;

  StudyRecordProvider();

  @override
  void onInit() {
    super.onInit();
    _isar = Get.find<IsarService>().isar;
  }

  /// 保存学习记录
  Future<void> saveRecord(StudyRecord record) async {
    await _isar.writeTxn(() async {
      await _isar.collection<StudyRecord>().put(record);
    });
  }

  /// 获取所有学习记录
  Future<List<StudyRecord>> getAllRecords() async {
    return await _isar.collection<StudyRecord>()
        .where()
        .sortByStudyTimeDesc()
        .findAll();
  }

  /// 获取指定时间范围内的学习记录
  Future<List<StudyRecord>> getRecordsInDateRange(DateTime start, DateTime end) async {
    return await _isar.collection<StudyRecord>()
        .filter()
        .studyTimeGreaterThan(start)
        .and()
        .studyTimeLessThan(end)
        .sortByStudyTimeDesc()
        .findAll();
  }

  /// 获取最近的学习记录
  Future<List<StudyRecord>> getRecentRecords(int limit) async {
    return await _isar.collection<StudyRecord>()
        .where()
        .sortByStudyTimeDesc()
        .limit(limit)
        .findAll();
  }

  /// 获取学习统计数据
  Future<Map<String, dynamic>> getStudyStatistics() async {
    final records = await getAllRecords();
    
    if (records.isEmpty) {
      return {
        'totalStudyTime': 0,
        'totalQuestions': 0,
        'totalWrongQuestions': 0,
        'averageAccuracy': 0.0,
        'averageTimePerQuestion': 0.0,
      };
    }

    final totalStudyTime = records.fold<int>(
      0, 
      (sum, record) => sum + record.totalTimeInSeconds
    );
    
    final totalQuestions = records.fold<int>(
      0, 
      (sum, record) => sum + record.totalQuestions
    );
    
    final totalWrongQuestions = records.fold<int>(
      0, 
      (sum, record) => sum + record.wrongQuestions
    );

    final averageAccuracy = records.fold<double>(
      0.0, 
      (sum, record) => sum + record.accuracy
    ) / records.length;

    final averageTimePerQuestion = records.fold<double>(
      0.0, 
      (sum, record) => sum + record.averageTimePerQuestion
    ) / records.length;

    return {
      'totalStudyTime': totalStudyTime,
      'totalQuestions': totalQuestions,
      'totalWrongQuestions': totalWrongQuestions,
      'averageAccuracy': averageAccuracy,
      'averageTimePerQuestion': averageTimePerQuestion,
    };
  }

  /// 删除学习记录
  Future<void> deleteRecord(StudyRecord record) async {
    await _isar.writeTxn(() async {
      await _isar.collection<StudyRecord>().delete(record.id);
    });
  }

  /// 清空所有学习记录
  Future<void> clearAllRecords() async {
    await _isar.writeTxn(() async {
      await _isar.collection<StudyRecord>().clear();
    });
  }
}
