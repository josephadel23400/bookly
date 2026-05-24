import 'package:bookly/core/resources/assets_manager.dart';
import 'package:bookly/core/widgets/search_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/resources/routs_manager.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.h, bottom: 20.h, right: 15.w, left: 25.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(ImageManager.logoSvg, height: 16.1.h),
          SearchButton(
            onPressed: () {
              context.push(Routes.searchForBook);
            },
          ),
        ],
      ),
    );
  }
}
