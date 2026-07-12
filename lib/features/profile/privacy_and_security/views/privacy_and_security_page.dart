import 'package:bookly/features/profile/privacy_and_security/views/widgets/privacy_and_security_app_bar.dart';
import 'package:bookly/features/profile/privacy_and_security/views/widgets/privacy_and_security_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrivacyAndSecurityPage extends StatelessWidget {
  const PrivacyAndSecurityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(padding: EdgeInsets.symmetric(horizontal: 20.w),
          children: [PrivacyAndSecurityAppBar(), PrivacyAndSecurityBody()],
        ),
      ),
    );
  }
}
