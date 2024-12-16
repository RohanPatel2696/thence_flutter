//======= PACKAGE IMPORTS =======//
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:nb_utils/nb_utils.dart';

//======= PROJECT IMPORTS =======//
import '../../presentation/export_presentations.dart';

//======= BLOC IMPORTS =======//
part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashBlocEvent, SplashState> {
  SplashBloc(super.initialState) {
    on<SplashBlocEvent>((event, emit) {});

    on<StartInitEvent>((event, emit) async {
      await 3.seconds.delay;
      const PlayerScreen().launch(navigatorKey.currentContext!);
    });
  }
}
