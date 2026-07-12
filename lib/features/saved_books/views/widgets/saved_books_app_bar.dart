import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/colors_manager.dart';
import '../../../../core/widgets/logo_and_button_app_bar.dart';

class SavedBooksAppBar extends StatelessWidget {
  const SavedBooksAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return LogoAndButtonAppBar(
      widgetIcon: PopupMenuButton(
        padding: EdgeInsets.zero,
        constraints: BoxConstraints(
          minWidth: 130.w,
          maxWidth: 140.w,
        ), // 👈 control width
        icon: Icon(
          Icons.filter_list_rounded,
          size: 23.h,
          color: ColorsManager.whiteColor.withValues(alpha: .7),
        ),
        itemBuilder: (context) => [
          PopupMenuItem(
            enabled: false, // 👈 not tappable
            height: 32, // 👈 shorter than normal items
            child: Text(
              'Sort by',
              style: TextStyle(
                color: ColorsManager.whiteColor.withValues(alpha: .4),
                fontSize: 11.sp,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.5,
              ),
            ),
          ),
          PopupMenuItem(
            value: 'newest',
            child: SizedBox(
              width: 119.w,
              child: Row(
                children: [
                  Icon(Icons.north_rounded, color: ColorsManager.orangeColor),
                  SizedBox(width: 4),
                  Text('Newest'),
                ],
              ),
            ),
          ),
          PopupMenuItem(
            value: 'oldest',
            child: SizedBox(
              width: 119.w,
              child: Row(
                children: [
                  Icon(Icons.south_rounded, color: ColorsManager.orangeColor),
                  SizedBox(width: 4),
                  Text('Oldest'),
                ],
              ),
            ),
          ),
          PopupMenuItem(
            value: 'thisMonth',
            child: SizedBox(
              width: 119.w,
              child: Row(
                children: [
                  Icon(
                    Icons.calendar_month_rounded,
                    color: ColorsManager.orangeColor,
                  ),
                  SizedBox(width: 4),
                  Text('This Month'),
                ],
              ),
            ),
          ),
        ],
        onSelected: (value) {
          // handle selection
        },
      ),
    );
  }
}
