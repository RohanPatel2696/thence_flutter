part of 'splash_bloc.dart';

@immutable
sealed class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object> get props => [];
}

final class SplashBlocInitial extends SplashState {}