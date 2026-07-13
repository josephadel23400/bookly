import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'log_in_state.dart';

class LogInCubit extends Cubit<LogInState> {
  LogInCubit() : super(LogInInitial());

  bool isPasswordObscured = true;

  void togglePasswordVisibility() {
    isPasswordObscured = !isPasswordObscured;
    // New instance with the flipped value, so Equatable sees it as a
    // different state and BlocBuilder rebuilds every tap (same fix as
    // the notifications cubit — never emit a state whose props haven't
    // actually changed).
    emit(LogInPasswordVisibilityChanged(isPasswordObscured));
  }
}
