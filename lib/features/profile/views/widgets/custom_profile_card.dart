import 'package:bookly/core/resources/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/colors_manager.dart';
import '../../../../core/resources/size_manager.dart';

class CustomProfileCard extends StatelessWidget {
  const CustomProfileCard({
    super.key,
    required this.cardName,
    required this.onTap,
    required this.icon,
    this.isOrange = false,
  });
  final String cardName;
  final bool isOrange;
  final void Function() onTap;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      radius: SizeManager.radiusMd,
      onTap: onTap,
      child: Container(
        width: SizeManager.screenSizeW90,
        decoration: BoxDecoration(shape:BoxShape.rectangle ,
          borderRadius: BorderRadius.circular(SizeManager.radiusSm),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 10.0.w),
                    child: Container(
                      height: 50.h,
                      width: 50.w,
                      decoration: BoxDecoration(
                        color: ColorsManager.iconButtonBackgroundGreyColor,
                        borderRadius: BorderRadius.circular(
                          SizeManager.radiusMd,
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          icon,
                          size: 25.h,
                          color: ColorsManager.readingTextColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    cardName,
                    style: TextStylesManager.displayMedium(
                      context,
                      color: isOrange
                          ? ColorsManager.orangeColor
                          : ColorsManager.whiteColor,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.chevron_right_outlined,
                    color: ColorsManager.grayTextColor.withValues(alpha: .6),
                    size: 30.sp,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
