import 'package:bookly/core/resources/size_manager.dart';
import 'package:bookly/core/resources/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/colors_manager.dart';
import '../../../../core/resources/styles_manager.dart';

class SliderThirdPage extends StatelessWidget {
  const SliderThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(ImageManager.bookDetails, width: 240.w),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: SizeManager.paddingLg),
            child: Center(
              child: Text(
                textAlign: TextAlign.center,
                'Buy the book you need and download add it to your library 🔍',
                style: TextStylesManager.displayMedium(
                  context,
                  size: SizeManager.mediumFontSize18,
                ),
              ),
            ),
          ),
          SizedBox(height: SizeManager.paddingLg),
          // Container(
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(SizeManager.radiusFull),
          //     boxShadow: [
          //       // outer glow
          //       BoxShadow(
          //         color: ColorsManager.lightBlueColor.withValues(alpha: 0.6),
          //         blurRadius: 15.r,
          //         spreadRadius: 2.r,
          //       ),
          //       // inner glow (negative spread pulls it inward)
          //       BoxShadow(
          //         color: ColorsManager.lightBlueColor.withValues(alpha: 0.3),
          //         blurRadius: 8.r,
          //         spreadRadius: -2.r,
          //       ),
          //     ],
          //   ),
          //   child: ElevatedButton(
          //     style: ElevatedButton.styleFrom(
          //       shape: RoundedRectangleBorder(
          //         side: BorderSide(
          //           color: ColorsManager.glowingBlueColor.withValues(alpha: .4),
          //           width: 1.5.w,
          //         ),
          //         borderRadius: BorderRadius.circular(SizeManager.radiusFull),
          //       ),
          //       fixedSize: Size(SizeManager.screenSizeW90, 55.h),
          //       backgroundColor: ColorsManager.darkBlueColor, // dark navy fill
          //       elevation: 0, // remove default shadow so only your glow shows
          //     ),
          //     onPressed: () {
          //       context.push('/books');
          //     },
          //     child: Text(
          //       'LOG IN TO BUY & DOWNLOAD',
          //       style: TextStylesManager.displayLarge(
          //         context,
          //         size: SizeManager.mediumFontSize18,
          //         color: ColorsManager.whiteColor,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
