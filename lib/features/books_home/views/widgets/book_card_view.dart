import 'package:bookly/core/resources/colors_manager.dart';
import 'package:bookly/core/resources/size_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/styles_manager.dart';

class BookCardView extends StatelessWidget {
  const BookCardView({
    super.key,
    required this.image,
    required this.name,
    required this.author,
    required this.bookRating,
    required this.price,
    required this.views,
  });
  final String image;
  final String name;
  final String author;
  final double bookRating;
  final double price;
  final int views;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10.h),
      //height: 120.h,
      width: SizeManager.screenSizeW90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 107.h,
            width: 75.w,
            padding: EdgeInsets.only(right: 25.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(SizeManager.radiusSm),
              ),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(width: 25.w),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStylesManager.titleMedium(
                    context,
                    size: SizeManager.mediumFontSize18,
                  ),
                ),
                SizedBox(height: 2.h),

                Text(
                  author,
                  style: TextStylesManager.displaySmall(
                    color: ColorsManager.whiteColor.withValues(alpha: .5),
                    context,
                    fontWeight: FontWeight.w500,
                    size: SizeManager.smallFontSize14,
                  ),
                ),
                SizedBox(height: 2.h),

                Row(
                  children: [
                    Text(
                      '$price \$',
                      style: TextStylesManager.displayMedium(
                        context,
                        fontWeight: FontWeight.w700,
                        size: 24.sp,
                      ),
                    ),
                    Spacer(),
                    Icon(
                      size: 15.h,
                      Icons.star_rate_rounded,
                      color: ColorsManager.yellowColor,
                    ),
                    Text(
                      '$bookRating \$',
                      style: TextStylesManager.displaySmall(
                        context,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '($views)',
                      style: TextStylesManager.displaySmall(
                        context,
                        size: SizeManager.smallFontSize14,
                        fontWeight: FontWeight.w500,
                        color: ColorsManager.whiteColor.withValues(alpha: .5),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
