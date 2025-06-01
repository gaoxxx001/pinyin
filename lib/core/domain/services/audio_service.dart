import 'package:audioplayers/audioplayers.dart';

class AudioService {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;

  Future<void> playAudio(String audioPath) async {
    try {
      if (_isPlaying) {
        await _audioPlayer.stop();
      }
      await _audioPlayer.play(AssetSource(audioPath));
      _isPlaying = true;
    } catch (e) {
      print('Error playing audio: $e');
      _isPlaying = false;
    }
  }

  Future<void> stopAudio() async {
    try {
      await _audioPlayer.stop();
      _isPlaying = false;
    } catch (e) {
      print('Error stopping audio: $e');
    }
  }

  Future<void> dispose() async {
    await _audioPlayer.dispose();
  }
} 