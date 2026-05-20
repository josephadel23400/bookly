import 'dart:ui';
import 'package:bookly/core/resources/assets_manager.dart';
import 'package:bookly/core/resources/colors_manager.dart';
import 'package:bookly/core/resources/size_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class FloatNavigationBar extends StatelessWidget {
  const FloatNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 30.h,
      right: 55.w,
      left: 55.w,
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(SizeManager.radiusFull),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: Container(
            color: ColorsManager.whiteColor.withValues(alpha: .5),
            width: SizeManager.screenSizeW80,
            height: 60.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    ImageManager.bookIconSVG,
                    colorFilter: ColorFilter.mode(
                      ColorsManager.whiteColor.withValues(
                        alpha:
                            GoRouterState.of(context).uri.toString() == '/books'
                            ? 1
                            : .5,
                      ),
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.bookmark,
                    color: ColorsManager.whiteColor.withValues(
                      alpha: GoRouterState.of(context).uri.toString() == '/'
                          ? 1
                          : .5,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    ImageManager.shelfIconSVG,
                    colorFilter: ColorFilter.mode(
                      ColorsManager.whiteColor.withValues(
                        alpha: GoRouterState.of(context).uri.toString() == '/'
                            ? 1
                            : .7,
                      ),
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(ImageManager.profileImage),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
