import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/colors_manager.dart';
import '../resources/styles_manager.dart';

class CustomTile extends StatelessWidget {
  const CustomTile({
    super.key,
    this.icon,
    required this.label,
    this.isRed,
    required this.onTap,
  });
  final IconData? icon;
  final String label;
  final bool? isRed;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 15.w),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                if (icon != null) ...[
                  Container(
                    width: 36.w,
                    height: 36.w,
                    decoration: BoxDecoration(
                      color: ColorsManager.buttonOrangeColor.withValues(
                        alpha: 0.15,
                      ),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Icon(
                      icon,
                      color: ColorsManager.buttonOrangeColor,
                      size: 18.sp,
                    ),
                  ),
                  SizedBox(width: 12.w),
                ],
                Text(
                  label,
                  style: TextStylesManager.displaySmall(
                    context,
                    fontWeight: FontWeight.w500,
                    color: isRed == null
                        ? ColorsManager.whiteColor
                        : ColorsManager.errorColor,
                  ),
                ),


              ],

            ),
            Icon(
              Icons.chevron_right_rounded,
              color: ColorsManager.grayTextColor.withValues(alpha: .5),
            ),
          ],
        ),
      ),
    );
  }
}
