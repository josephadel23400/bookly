import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/resources/assets_manager.dart';
import '../../../../../core/widgets/custom_icon_button.dart';

class OtpAppBar extends StatelessWidget {
  const OtpAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomIconButton(
          onPressed: () {
            context.pop();
          },
          size: 25.sp,
          icon: Icons.arrow_back,
        ),
        SizedBox(height: 80.h),
      ],
    );
  }
}
