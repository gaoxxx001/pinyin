import 'package:isar/isar.dart';

part 'study_record.g.dart';

@collection
class StudyRecord {
  Id id = Isar.autoIncrement;

  // 本次做题总数
  int totalQuestions;

  // 错题数
  int wrongQuestions;

  // 总用时（秒）
  int totalTimeInSeconds;

  // 做题时间
  @Index()
  DateTime studyTime;

  // 计算正确率
  double get accuracy => totalQuestions > 0 
      ? (totalQuestions - wrongQuestions) / totalQuestions 
      : 0.0;

  // 计算平均每题用时（秒）
  double get averageTimePerQuestion => totalQuestions > 0 
      ? totalTimeInSeconds / totalQuestions 
      : 0.0;

  StudyRecord({
    required this.totalQuestions,
    required this.wrongQuestions,
    required this.totalTimeInSeconds,
    required this.studyTime,
  });

  // 创建一个新的学习记录
  static StudyRecord create({
    required int totalQuestions,
    required int wrongQuestions,
    required int totalTimeInSeconds,
  }) {
    return StudyRecord(
      totalQuestions: totalQuestions,
      wrongQuestions: wrongQuestions,
      totalTimeInSeconds: totalTimeInSeconds,
      studyTime: DateTime.now(),
    );
  }

  // 从 Map 创建学习记录
  factory StudyRecord.fromMap(Map<String, dynamic> map) {
    return StudyRecord(
      totalQuestions: map['totalQuestions'] as int,
      wrongQuestions: map['wrongQuestions'] as int,
      totalTimeInSeconds: map['totalTimeInSeconds'] as int,
      studyTime: DateTime.parse(map['studyTime'] as String),
    );
  }

  // 转换为 Map
  Map<String, dynamic> toMap() {
    return {
      'totalQuestions': totalQuestions,
      'wrongQuestions': wrongQuestions,
      'totalTimeInSeconds': totalTimeInSeconds,
      'studyTime': studyTime.toIso8601String(),
    };
  }

  @override
  String toString() {
    return 'StudyRecord{'
        '总题数: $totalQuestions, '
        '错题数: $wrongQuestions, '
        '正确率: ${(accuracy * 100).toStringAsFixed(1)}%, '
        '总用时: ${totalTimeInSeconds}秒, '
        '平均用时: ${averageTimePerQuestion.toStringAsFixed(1)}秒/题, '
        '学习时间: ${studyTime.toString().substring(0, 19)}'
        '}';
  }
}