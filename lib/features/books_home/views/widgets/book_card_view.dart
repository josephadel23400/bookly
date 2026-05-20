import 'package:bookly/core/resources/colors_manager.dart';
import 'package:bookly/core/resources/size_manager.dart';
import 'package:bookly/core/resources/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      padding: EdgeInsets.only(bottom: 25.h),
      height: 125.h,
      width: SizeManager.screenSizeW90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 115.h,
            width: 70.w,
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
                Text(name, style: TextStylesManager.displayMedium(context)),
                SizedBox(height: 7.h),

                Text(
                  author,
                  style: TextStylesManager.displaySmall(
                    color: ColorsManager.whiteColor.withValues(alpha: .5),
                    context,
                    size: SizeManager.smallFontSize14,
                  ),
                ),
                SizedBox(height: 7.h),

                Row(
                  children: [
                    Text(
                      '$price \$',
                      style: TextStylesManager.displayMedium(
                        context,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Spacer(),
                    Icon(
                      size: 13.h,
                      Icons.star_rate_rounded,
                      color: ColorsManager.yellowColor,
                    ),
                    Text(
                      '$bookRating \$',
                      style: TextStylesManager.displaySmall(context),
                    ),
                    Text(
                      '($views)',
                      style: TextStylesManager.displaySmall(
                        context,
                        size: SizeManager.smallFontSize14,
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
