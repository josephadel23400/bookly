part of 'sign_up_cubit.dart';

sealed class SignUpState extends Equatable {
  const SignUpState();
  @override
  List<Object> get props => [];
}

final class SignUpInitial extends SignUpState {}

final class SignUpPasswordVisibilityChanged extends SignUpState {
  final bool isPasswordVisible;
  final bool isConfirmPasswordVisible;
  final bool isAgreedToTerms;
  const SignUpPasswordVisibilityChanged(
    this.isPasswordVisible,
    this.isConfirmPasswordVisible,
    this.isAgreedToTerms,
  );
  @override
  List<Object> get props => [
    isPasswordVisible,
    isConfirmPasswordVisible,
    isAgreedToTerms,
  ];
}
