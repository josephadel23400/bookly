import 'package:bookly/core/resources/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/colors_manager.dart';
import 'bookly_animation.dart';

class SliderFirstPage extends StatelessWidget {
  const SliderFirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BooklyAnimation(),
          SizedBox(height: 100.h),
          Text(
            'Find Your Book With Bookly ❤️',
            style: TextStylesManager.displaySmall(
              context,
              color: ColorsManager.whiteColor.withValues(alpha: .7),
            ),
          ),
        ],
      ),
    );
  }
}
