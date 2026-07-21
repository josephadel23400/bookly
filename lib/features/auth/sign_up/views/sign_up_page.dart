import 'package:bookly/features/auth/sign_up/views/widgets/sign_up_app_bar.dart';
import 'package:bookly/features/auth/sign_up/views/widgets/sign_up_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          children: [SignUpAppBar(), SignUpBody()],
        ),
      ),
    );
  }
}
