part of 'splash_bloc.dart';

sealed class SplashBlocEvent extends Equatable {
  const SplashBlocEvent();

  @override
  List<Object> get props => [];
}

class StartInitEvent extends SplashBlocEvent {}
