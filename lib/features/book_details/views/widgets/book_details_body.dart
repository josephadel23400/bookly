import 'package:bookly/core/resources/assets_manager.dart';
import 'package:bookly/core/resources/colors_manager.dart';
import 'package:bookly/core/resources/size_manager.dart';
import 'package:bookly/core/resources/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 478.h,
      width: SizeManager.screenSizeW100,
      padding: EdgeInsets.only(right: 30.w, left: 30.w, top: 15.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(SizeManager.radiusMd),
            child: Image.asset(
              ImageManager.bookImage,
              height: 250.h,
              width: 162.w,
            ),
          ),
          SizedBox(height: 25.h),
          Text(
            'The Jungle Book',
            style: TextStylesManager.titleMedium(
              context,
              size: SizeManager.largeFontSize30,
            ),
          ),
          SizedBox(height: 5.h),

          Text(
            'Rudyard Kipling',
            style: TextStylesManager.displaySmall(
              fontWeight: FontWeight.w400,
              context,
              color: ColorsManager.whiteColor.withValues(alpha: .5),
            ),
          ),
          SizedBox(height: 15.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 5.0.w),
                child: Icon(
                  Icons.star_rate_rounded,
                  color: ColorsManager.yellowColor,
                  size: 19.h,
                ),
              ),
              Text(
                '4.8',
                style: TextStylesManager.displaySmall(
                  context,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(width: 5.w),
              Text(
                '(2390)',
                style: TextStylesManager.displaySmall(
                  context,
                  size: SizeManager.smallFontSize13,
                  color: ColorsManager.whiteColor.withValues(alpha: .5),
                ),
              ),
            ],
          ),
          SizedBox(height: 30.h),
          Container(
            //padding: EdgeInsets.only(top: 30.h),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(999),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Left: Price
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Text(
                    '19.99€',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                ),
                // Right: Button
                GestureDetector(
                  onTap: () {
                    // your action here
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 22,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFFE8826A), // salmon/coral color
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Text(
                      'Free preview',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
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
