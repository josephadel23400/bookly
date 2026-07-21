import 'package:bookly/features/auth/forget_password/views/widgets/forget_password_app_bar.dart';
import 'package:bookly/features/auth/forget_password/views/widgets/forget_password_body.dart';
import 'package:bookly/features/auth/otp/views/widgets/otp_app_bar.dart';
import 'package:bookly/features/auth/otp/views/widgets/otp_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          children: [OtpAppBar(), OtpBody()],
        ),
      ),
    );
  }
}
