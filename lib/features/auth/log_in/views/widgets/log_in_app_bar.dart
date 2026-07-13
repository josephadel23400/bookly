import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/resources/assets_manager.dart';



class LogInAppBar extends StatelessWidget {
  const LogInAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(ImageManager.logoSvg, height: 30.h),
        SizedBox(height: 80.h),
      ],
    );
  }
}
