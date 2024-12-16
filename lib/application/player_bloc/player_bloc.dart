//======= PACKAGE IMPORTS =======//
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

//======= PROJECT IMPORTS =======//
import '../../services/player_service.dart';
import '../../utils/export_utils.dart';

//======= BLOC IMPORTS =======//
part 'player_event.dart';
part 'player_state.dart';

class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  PlayerBloc() : super(AudioInitial()) {
    on<PlayAudio>(_onPlayAudio);
    on<PauseAudio>(_onPauseAudio);
  }

  void _onPlayAudio(PlayAudio event, Emitter<PlayerState> emit) async {

    await PlayerService.instance.audioStart(url: audioFile);
    emit(AudioPlaying());
  }

  void _onPauseAudio(PauseAudio event, Emitter<PlayerState> emit) async {
    await PlayerService.instance.audioPause();

    emit(AudioPaused());
  }

  @override
  Future<void> close() {
    PlayerService.instance.audioPlayer.dispose();
    return super.close();
  }
}
