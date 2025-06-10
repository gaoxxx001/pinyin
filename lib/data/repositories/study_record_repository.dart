import 'package:get/get.dart';
import 'package:pinyin/data/models/study_record.dart';
import 'package:pinyin/data/providers/study_record_provider.dart';

class StudyRecordRepository extends GetxService {
  late StudyRecordProvider studyRecordProvider;

  @override
  void onInit() {
    super.onInit();
    studyRecordProvider = Get.find<StudyRecordProvider>();
  }

  /// 保存一条做题记录
  Future<void> saveRecord(StudyRecord record) async {
    await studyRecordProvider.saveRecord(record);
  }

  /// 获取最近 [limit] 条做题记录，按时间倒序排列
  Future<List<StudyRecord>> getRecentRecords(int limit) async {
    return await studyRecordProvider.getRecentRecords(limit);
  }
}