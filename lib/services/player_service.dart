//======= PACKAGE IMPORTS =======//
import 'package:audioplayers/audioplayers.dart';

class PlayerService {
  PlayerService._privateConstructor(); // Private constructor
  static final PlayerService instance = PlayerService._privateConstructor();
  final AudioPlayer audioPlayer = AudioPlayer();
  final PlayerState playerState = PlayerState.paused;

  Future<void> audioStart({required String url}) async {
    await audioPlayer.play(UrlSource(url));

    await audioPlayer.setReleaseMode(ReleaseMode.loop);
  }

  Future<void> audioPause() async {
    await audioPlayer.pause();
  }

  Future<void> audioPlay() async {
    await audioPlayer.resume();
  }
}
