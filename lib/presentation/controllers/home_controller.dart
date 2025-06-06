import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // 响应式变量
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  Future<void> loadData() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      
      // TODO: 实现数据加载逻辑
      
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
} 