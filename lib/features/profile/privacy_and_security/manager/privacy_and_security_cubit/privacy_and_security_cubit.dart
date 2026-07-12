import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'privacy_and_security_state.dart';

class PrivacyKey {
  static String towFactor = 'Tow Factor';
  static String privateProfile = 'Private Profile';
  static String showReadingActivity = 'Show Reading Activity';
}

class PrivacyAndSecurityCubit extends Cubit<PrivacyAndSecurityState> {
  final Map<String, bool> _privacySetting = {
    PrivacyKey.towFactor: true,
    PrivacyKey.showReadingActivity: true,
    PrivacyKey.privateProfile: false,
  };
  bool valueOf(String key) => _privacySetting[key] ?? false;
  PrivacyAndSecurityCubit() : super(PrivacyAndSecurityInitial());
  void toggle(String privacyKey, bool value) {
    _privacySetting[privacyKey] = value;
    emit(PrivacyAndSecurityUpdate(Map.unmodifiable(_privacySetting)));
  }
}
