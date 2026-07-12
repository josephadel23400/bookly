import 'package:bookly/core/resources/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/colors_manager.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: Text(
            'Profile',
            style: TextStylesManager.displayMedium(
              context,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 20.w),
          child: CircleAvatar(
            backgroundColor: ColorsManager.iconButtonBackgroundGreyColor,
            child: PopupMenuButton(
              child: Icon(
                Icons.settings_outlined,
                fontWeight: FontWeight.w400,
                color: ColorsManager.iconGrayColor,
              ),

              itemBuilder: (context) => [
                PopupMenuItem(child: Text('data')),

                PopupMenuItem(child: Text('data')),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
