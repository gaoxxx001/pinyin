import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/practice_controller.dart';

/// 主页面
/// 拼音练习的主界面
class PracticePage extends GetView<PracticeController> {
  const PracticePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('拼音练习')),
    );
  }
} 