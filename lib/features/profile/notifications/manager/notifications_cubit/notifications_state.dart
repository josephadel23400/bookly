part of 'notifications_cubit.dart';

sealed class NotificationsState extends Equatable {
  const NotificationsState();
  @override
  List<Object> get props => [];
}

final class NotificationsInitial extends NotificationsState {}


final class NotificationsUpdated extends NotificationsState {
  final Map<String, bool> settings;
  const NotificationsUpdated(this.settings);

  @override
  List<Object> get props => [settings];
}
