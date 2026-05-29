import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../resources/colors_manager.dart';
import '../resources/routs_manager.dart';

class GoToHomePageIcon extends StatelessWidget {
  const GoToHomePageIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.go(Routes.booksPage);
      },
      icon: ClipOval(
        child: Container(
          height: 55.h,
          width: 55.h,
          color: ColorsManager.whiteColor.withValues(alpha: .3),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
            child: Icon(
              color: ColorsManager.whiteColor,
              Icons.home_rounded,
              size: 35.h,
            ),
          ),
        ),
      ),
    );
  }
}
