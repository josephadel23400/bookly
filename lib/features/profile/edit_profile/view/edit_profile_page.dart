import 'package:bookly/core/widgets/custom_app_bar_with_back_button.dart';
import 'package:bookly/core/widgets/logo_and_button_app_bar.dart';
import 'package:bookly/features/profile/edit_profile/view/widgets/edit_profile_app_bar.dart';
import 'package:bookly/features/profile/edit_profile/view/widgets/edit_profile_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 0),
          child: ListView(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            children: [EditProfileAppBar(), EditProfileBody()],
          ),
        ),
      ),
    );
  }
}
