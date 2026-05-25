import 'dart:ui';
import 'package:bookly/core/app/app_cubit/app_cubit.dart';
import 'package:bookly/core/resources/assets_manager.dart';
import 'package:bookly/core/resources/colors_manager.dart';
import 'package:bookly/core/resources/size_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'nav_item.dart';

class FloatNavigationBar extends StatelessWidget {
  const FloatNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    int currentIndex = context.read<AppCubit>().state.currentTabIndex;
    return Positioned(
      bottom: 30.h,
      right: 55.w,
      left: 55.w,
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(SizeManager.radiusFull),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: Container(
            color: ColorsManager.whiteColor.withValues(alpha: .3),
            width: SizeManager.screenSizeW80,
            height: 60.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                NavItem(
                  index: 0,
                  currentIndex: currentIndex,
                  child: SvgPicture.asset(ImageManager.bookIconSVG),
                ),
                NavItem(
                  index: 1,
                  currentIndex: currentIndex,
                  child: Icon(Icons.bookmark, color: ColorsManager.whiteColor),
                ),
                NavItem(
                  index: 2,
                  currentIndex: currentIndex,
                  child: Icon(
                    Icons.folder_copy_rounded,
                    color: ColorsManager.whiteColor,
                  ),
                ),
                NavItem(
                  index: 3,
                  alwaysFullOpacity: true,
                  currentIndex: currentIndex,
                  child: Image.asset(ImageManager.profileImage, height: 45.h),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
