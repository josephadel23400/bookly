part of 'splash_cubit.dart';

sealed class SplashState extends Equatable {
  const SplashState();
  @override
  List<Object> get props => [];
}

class SplashInitial extends SplashState {}

class SplashPageChanged extends SplashState {
  final int currentIndex;
  const SplashPageChanged(this.currentIndex);
  @override
  List<Object> get props => [currentIndex];
}
