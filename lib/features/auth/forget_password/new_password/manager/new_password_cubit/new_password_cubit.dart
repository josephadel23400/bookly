import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'new_password_state.dart';

class NewPasswordCubit extends Cubit<NewPasswordState> {
  NewPasswordCubit() : super(NewPasswordInitial());
  bool isPasswordObscured = true;
  bool isConfirmPasswordObscured = true;

  void togglePasswordVisibility() {
    isPasswordObscured = !isPasswordObscured;
    // New instance with the flipped value, so Equatable sees it as a
    // different state and BlocBuilder rebuilds every tap (same fix as
    // the notifications cubit — never emit a state whose props haven't
    // actually changed).
    emit(
      NewPasswordVisibilityChanged(
        isPasswordObscured,
        isConfirmPasswordObscured,
      ),
    );
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordObscured = !isConfirmPasswordObscured;
    // New instance with the flipped value, so Equatable sees it as a
    // different state and BlocBuilder rebuilds every tap (same fix as
    // the notifications cubit — never emit a state whose props haven't
    // actually changed).
    emit(
      NewPasswordVisibilityChanged(
        isPasswordObscured,
        isConfirmPasswordObscured,
      ),
    );
  }
}
