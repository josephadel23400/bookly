import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'notifications_state.dart';
class NotificationKeys {
  static const push = 'push';
  static const email = 'email';
  static const newReleases = 'newReleases';
  static const readingReminders = 'readingReminders';
  static const recommendations = 'recommendations';
  static const friendActivity = 'friendActivity';
}

class NotificationsCubit extends Cubit<NotificationsState> {
  final Map<String, bool> _settings = {
    NotificationKeys.push: true,
    NotificationKeys.email: false,
    NotificationKeys.newReleases: true,
    NotificationKeys.readingReminders: true,
    NotificationKeys.recommendations: false,
    NotificationKeys.friendActivity: false,
  };
  bool valueOf(String key) => _settings[key] ?? false;
  bool value1 = false;
  bool value2 = true;
  NotificationsCubit() : super(NotificationsInitial());
  void toggle(String key, bool value) {
    _settings[key] = value;
    // A new Map instance with the changed value means props actually
    // differ from the previous state, so BlocBuilder rebuilds every time.
    emit(NotificationsUpdated(Map.unmodifiable(_settings)));
  }
}
