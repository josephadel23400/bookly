import 'package:bookly/core/resources/size_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/colors_manager.dart';
import '../resources/styles_manager.dart';

class CustomNotificationTile extends StatelessWidget {
  const CustomNotificationTile({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
    this.icon,
    this.isSmallerFont,
  });

  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;
  final IconData? icon;
 final bool? isSmallerFont ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 14.h,horizontal: 15.w),
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
                  size: isSmallerFont==null?SizeManager.smallFontSize16:SizeManager.smallFontSize15,
                  color: ColorsManager.whiteColor,
                ),

              ),
            ],
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: Colors.white,
            activeTrackColor: ColorsManager.buttonOrangeColor,
            inactiveThumbColor: ColorsManager.grayTextColor,
            inactiveTrackColor: ColorsManager.darkGrayColor,
          ),
        ],
      ),
    );
  }
}
