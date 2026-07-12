part of 'privacy_and_security_cubit.dart';

sealed class PrivacyAndSecurityState extends Equatable {
  const PrivacyAndSecurityState();
  @override
  List<Object> get props => [];
}

final class PrivacyAndSecurityInitial extends PrivacyAndSecurityState {}

final class PrivacyAndSecurityUpdate extends PrivacyAndSecurityState {
  final Map<String, bool> settings;
  const PrivacyAndSecurityUpdate(this.settings);
  @override
  List<Object> get props => [settings];
}
