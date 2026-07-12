import 'package:bookly/core/resources/colors_manager.dart';
import 'package:bookly/core/resources/size_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/styles_manager.dart';

class DataCard extends StatelessWidget {
  DataCard({
    super.key,
    required this.text1,
    required this.text2,
    this.withStar = false,
  });
  final String text1;
  final String text2;
  bool? withStar;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsManager.iconButtonBackgroundGreyColor,
        borderRadius: BorderRadius.circular(SizeManager.radiusSm),
      ),
      height: 50.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text1,
            style: TextStylesManager.displaySmall(
              context,
              fontWeight: FontWeight.w700,
              size: SizeManager.smallFontSize14,
              color: ColorsManager.whiteColor,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (withStar!)
                  Icon(
                    Icons.star_border_rounded,
                    size: 15.h,
                    color: ColorsManager.whiteColor.withValues(alpha: .7),
                  ),
                Text(
                  text2,
                  style: TextStylesManager.displaySmall(
                    context,
                    fontWeight: FontWeight.w500,
                    size: SizeManager.smallFontSize12,
                    color: ColorsManager.whiteColor.withValues(alpha: .7),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
