import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';

/// 音频播放提供者
/// 负责处理音频播放相关功能
class AudioProvider extends GetxService {
  late final AudioPlayer _audioPlayer;
  final RxBool isPlaying = false.obs;

  @override
  void onInit() {
    super.onInit();
    _audioPlayer = AudioPlayer();
  }

  /// 播放音频文件
  Future<void> playAudio(String audioPath) async {
    try {
      if (isPlaying.value) {
        await stopAudio();
      }
      
      // 确保音频路径以 assets/ 开头
      final normalizedPath = audioPath.startsWith('assets/') 
          ? audioPath 
          : 'assets/$audioPath';
          
      await _audioPlayer.play(AssetSource(normalizedPath));
      isPlaying.value = true;
      
      // 监听播放完成事件
      _audioPlayer.onPlayerComplete.listen((_) {
        isPlaying.value = false;
      });
    } catch (e) {
      Get.snackbar(
        '音频错误',
        '播放音频失败：${e.toString()}',
        snackPosition: SnackPosition.TOP,
      );
      isPlaying.value = false;
    }
  }

  /// 停止播放音频
  Future<void> stopAudio() async {
    try {
      await _audioPlayer.stop();
      isPlaying.value = false;
    } catch (e) {
      Get.snackbar(
        '音频错误',
        '停止播放失败：${e.toString()}',
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  @override
  void onClose() {
    _audioPlayer.dispose();
    super.onClose();
  }
} 