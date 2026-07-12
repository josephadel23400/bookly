import 'package:bookly/features/profile/notifications/views/widgets/notifications_app_bar.dart';
import 'package:bookly/features/profile/notifications/views/widgets/notifications_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          children: [NotificationsAppBar(), NotificationsBody()],
        ),
      ),
    );
  }
}
