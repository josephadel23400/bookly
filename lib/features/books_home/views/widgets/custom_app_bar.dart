import 'package:bookly/core/resources/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 8.h,
        bottom: 20.h,
        right: 15.w,
        left: 25.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(ImageManager.logoSvg, height: 16.1.h),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              ImageManager.searchIconSVG,
              width: 19.w,
              height: 19.h,
            ),
          ),
        ],
      ),
    );
  }
}
