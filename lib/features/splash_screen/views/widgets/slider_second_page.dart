import 'package:bookly/core/resources/assets_manager.dart';
import 'package:bookly/core/resources/size_manager.dart';
import 'package:bookly/core/resources/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/colors_manager.dart';
import '../../../../core/resources/styles_manager.dart';

class SliderSecondPage extends StatelessWidget {
  const SliderSecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(ImageManager.mainPage, width: 250.h),
         SizedBox(height: 30.h),
          Text(
            ' Search in 5000+ and enjoy reading 🔍 ',
            style: TextStylesManager.displayMedium(
              context,
              color: ColorsManager.whiteColor,
              size: SizeManager.mediumFontSize18,
            ),
          ),
        ],
      ),
    );
  }
}
