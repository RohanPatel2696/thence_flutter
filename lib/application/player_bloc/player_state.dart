part of 'player_bloc.dart';

@immutable
sealed class PlayerState extends Equatable {
  const PlayerState();

  @override
  List<Object> get props => [];
}

class AudioInitial extends PlayerState {}

class AudioPlaying extends PlayerState {}

class AudioPaused extends PlayerState {}

class AudioStopped extends PlayerState {}