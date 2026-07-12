import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/resources/size_manager.dart';
import '../../../../../core/resources/styles_manager.dart';
import '../../../../../core/widgets/custom_icon_button.dart';

class PrivacyAndSecurityAppBar extends StatelessWidget {
  const PrivacyAndSecurityAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomIconButton(
              onPressed: () {
                context.pop();
              },
              size: 25.sp,
              icon: Icons.arrow_back_rounded,
            ),
            SizedBox(width: 15.w),
            Text(
              'Privacy and security',
              style: TextStylesManager.displayMedium(
                context,
                size: SizeManager.mediumFontSize22,
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
      ],
    );
  }
}
