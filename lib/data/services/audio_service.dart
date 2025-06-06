import 'package:get/get.dart';

class AudioService extends GetxService {
  final RxBool isPlaying = false.obs;

  Future<void> playAudio(String path) async {
    try {
      isPlaying.value = true;
      // TODO: 实现音频播放逻辑
      await Future.delayed(const Duration(seconds: 1));
    } finally {
      isPlaying.value = false;
    }
  }

  void stopAudio() {
    // TODO: 实现停止音频播放逻辑
    isPlaying.value = false;
  }
} 