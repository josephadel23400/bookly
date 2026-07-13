
import 'package:bookly/features/auth/log_in/views/widgets/log_in_app_bar.dart';
import 'package:bookly/features/auth/log_in/views/widgets/log_in_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          children: [LogInAppBar(), LogInBody()],
        ),
      ),
    );
  }
}
