import 'package:bookly/core/resources/assets_manager.dart';
import 'package:bookly/core/widgets/logo_and_button_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/app/app_cubit/app_cubit.dart';
import '../../../../core/resources/colors_manager.dart';
import '../../../../core/resources/size_manager.dart';

class UserBookDetailsAppBar extends StatelessWidget {
  const UserBookDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 13.w),
      height: 65.h,
      width: SizeManager.screenSizeW100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundColor: ColorsManager.darkGrayColor,
            radius: 25.r,
            //foregroundColor: ColorsManager.darkGrayColor,
            child: IconButton(
              onPressed: () {
                context.read<AppCubit>().goBack();
                context.pop();
              },
              icon: Icon(
                size: 22.h,

                Icons.arrow_back,
                color: ColorsManager.whiteColor,
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(left: 25.0.w),
            child: Text(
              'Book Status',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: ColorsManager.whiteColor.withValues(alpha: .7),
                fontSize: SizeManager.smallFontSize14,
              ),
            ),
          ),
          SvgPicture.asset(ImageManager.logoSvg),
        ],
      ),
    );
  }
}
