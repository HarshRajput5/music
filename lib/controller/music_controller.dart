import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class MusicController extends GetxController {
  static MusicController get instance => Get.find();
  late AudioPlayer player;
  final isPlay = false.obs;
  
  @override
  void onInit() async {
    super.onInit();
    player = AudioPlayer();
    await player.setAsset('assets/music_1.mp3');
  }

  Future<void> toggelplay() async {
    if (isPlay.value) {
      isPlay.value = !isPlay.value;
      await player.pause();
      print('pause');
    } else {
      isPlay.value = !isPlay.value;
      await player.play();
      print('Play');
    }
    
  }

  @override
  void dispose() {
    super.dispose();
    player.dispose();
  }
}
