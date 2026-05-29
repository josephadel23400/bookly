import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../resources/assets_manager.dart';
import '../resources/colors_manager.dart';

class LogoAndButtonAppBar extends StatelessWidget {
  const LogoAndButtonAppBar({super.key, required this.widgetIcon});

  final Widget widgetIcon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.h, bottom: 5.h, right: 15.w, left: 25.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(ImageManager.logoSvg, height: 16.1.h),
          CircleAvatar(
            backgroundColor: ColorsManager.darkGunmetalGreyColor,
            radius: 22.r,
            //foregroundColor: ColorsManager.darkGrayColor,
            child: widgetIcon,
          ),
        ],
      ),
    );
  }
}
