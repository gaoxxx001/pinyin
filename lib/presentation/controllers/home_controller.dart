import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/repositories/study_record_repository.dart';
import '../../data/models/study_record.dart';

class HomeController extends GetxController {
  // 响应式变量
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;
  final RxList<StudyRecord> recentRecords = <StudyRecord>[].obs;
  final RxList<double> accuracyList = <double>[].obs;
  final RxList<double> avgTimeList = <double>[].obs;

  late StudyRecordRepository studyRecordRepository;

  @override
  void onInit() {
    super.onInit();
    studyRecordRepository = Get.find<StudyRecordRepository>();
    loadData();
  }

  Future<void> loadData() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      final records = await studyRecordRepository.getRecentRecords(10);
      recentRecords.assignAll(records);
      accuracyList.assignAll(records.map((r) => r.accuracy));
      avgTimeList.assignAll(records.map((r) => r.averageTimePerQuestion));
    } catch (e) {
      errorMessage.value = e.toString();
      Get.snackbar(
        '错误',
        '加载数据失败：${e.toString()}',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> refreshData() async {
    await loadData();
  }

  void onStartPractice() {
    Get.toNamed('/practice');
  }

  void onGotoStatistics() {
    Get.toNamed('/statistics');
  }
} 