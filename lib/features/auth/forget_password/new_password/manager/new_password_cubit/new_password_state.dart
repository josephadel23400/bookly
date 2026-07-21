part of 'new_password_cubit.dart';

sealed class NewPasswordState extends Equatable {
  const NewPasswordState();
  @override
  List<Object> get props => [];
}

final class NewPasswordInitial extends NewPasswordState {}

final class NewPasswordVisibilityChanged extends NewPasswordState {
  final bool isPasswordHidden;
  final bool isConfirmPasswordHidden;
  const NewPasswordVisibilityChanged(
    this.isPasswordHidden,
    this.isConfirmPasswordHidden,
  );
  @override
  List<Object> get props => [isPasswordHidden, isConfirmPasswordHidden];
}
