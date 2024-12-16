part of 'player_bloc.dart';

abstract class PlayerEvent {}

class PlayAudio extends PlayerEvent {
  final String url;
  PlayAudio(this.url);
}

class PauseAudio extends PlayerEvent {}

class ResumeAudio extends PlayerEvent {}