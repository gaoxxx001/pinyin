import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';
import '../controllers/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('拼音学习'),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.errorMessage.isNotEmpty) {
          return Center(
            child: Text(controller.errorMessage.value, style: const TextStyle(color: Colors.red)),
          );
        }
        return Column(
          children: [
            // 折线图区域
            Padding(
              padding: const EdgeInsets.all(16),
              child: Stack(
                children: [
                  _buildLineChart(context),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: IconButton(
                      icon: const Icon(Icons.analytics_outlined),
                      tooltip: '数据统计',
                      onPressed: controller.onGotoStatistics,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 48),
            Padding(
              padding: const EdgeInsets.all(24),
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: Center(
                  child: FloatingActionButton(
                    onPressed: controller.onStartPractice,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Colors.white,
                    elevation: 4,
                    tooltip: '开始做题',
                    child: const Icon(Icons.play_arrow, size: 32),
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget _buildLineChart(BuildContext context) {
    final accuracy = controller.accuracyList;
    final avgTime = controller.avgTimeList;
    final int length = accuracy.length;
    if (length == 0) {
      return Container(
        height: 220,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child: Text(
            '暂无数据',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey[600]),
          ),
        ),
      );
    }
    return Container(
      height: 220,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: true),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: true, reservedSize: 40),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  final idx = value.toInt();
                  if (idx < 0 || idx >= length) return const SizedBox.shrink();
                  return Text('${idx + 1}');
                },
                reservedSize: 24,
              ),
            ),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          minY: 0,
          maxY: 100,
          lineBarsData: [
            // 正确率线
            LineChartBarData(
              spots: [
                for (int i = 0; i < length; i++)
                  FlSpot(i.toDouble(), (accuracy[i] * 100).clamp(0, 100)),
              ],
              isCurved: true,
              color: Colors.blue,
              barWidth: 3,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(show: false),
              isStrokeCapRound: true,
            ),
            // 平均用时线
            LineChartBarData(
              spots: [
                for (int i = 0; i < length; i++)
                  FlSpot(i.toDouble(), avgTime[i]),
              ],
              isCurved: true,
              color: Colors.orange,
              barWidth: 3,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(show: false),
              isStrokeCapRound: true,
            ),
          ],
          lineTouchData: LineTouchData(enabled: true),
        ),
      ),
    );
  }
} 