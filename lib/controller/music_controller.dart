import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class MusicController extends GetxController {
  static MusicController get instance => Get.find();
  late AudioPlayer player;
  final isPlay = false.obs;
  final currentPosition = Duration.zero.obs;
  final totalDuration = Duration.zero.obs;
  final backwordClick = 0.obs;
  final forwordClick = 0.obs;

  void forwordincremment() {
    forwordClick.value++;
    
  }
  void backincremment() {
    backwordClick.value++;
    
  }

  @override
  void onInit() async {
    super.onInit();
    player = AudioPlayer();
    await player.setAsset('assets/music_1.mp3').then(
          (_) => totalDuration.value = player.duration ?? Duration.zero,
        );
    player.positionStream.listen((position) {
      currentPosition.value = position;
    });
    player.playingStream.listen((playing) {
      isPlay.value = playing;
    });
  }

  Future<void> toggelplay() async {
    if (isPlay.value) {
      isPlay.value = !isPlay.value;
      await player.pause();
    } else {
      isPlay.value = !isPlay.value;
      await player.play();
    }
  }

  void seekTo(Duration position) async {
    await player.seek(position);
  }

  @override
  void onClose() {
    super.dispose();
    player.dispose();
  }
}
