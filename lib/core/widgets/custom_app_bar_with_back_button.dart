import 'package:bookly/core/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../resources/assets_manager.dart';
import '../resources/colors_manager.dart';

class CustomAppBarWithBackButton extends StatelessWidget {
  const CustomAppBarWithBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.h, bottom: 5.h, right: 15.w, left: 25.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundColor: ColorsManager.iconButtonBackgroundGreyColor,
            radius: 22.r,
            //foregroundColor: ColorsManager.darkGrayColor,
            child: CustomIconButton(
              onPressed: () {
                context.pop();
              },
              size: 15.sp,
              icon: Icons.arrow_back,
            ),
          ),
          SvgPicture.asset(ImageManager.logoSvg, height: 16.1.h),
        ],
      ),
    );
  }
}
