part of 'log_in_cubit.dart';

sealed class LogInState extends Equatable {
  const LogInState();
  @override
  List<Object> get props => [];
}

final class LogInInitial extends LogInState {}

final class LogInPasswordVisibilityChanged extends LogInState {
  final bool isObscured;
  const LogInPasswordVisibilityChanged(this.isObscured);
  @override
  List<Object> get props => [isObscured];
}
