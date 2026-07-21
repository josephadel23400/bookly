import 'package:bookly/core/resources/routs_manager.dart';
import 'package:bookly/core/widgets/custom_text_button.dart';
import 'package:bookly/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/resources/colors_manager.dart';
import '../../../../../core/resources/size_manager.dart';
import '../../../../../core/resources/styles_manager.dart';

class ForgetPasswordBody extends StatelessWidget {
  const ForgetPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0.w),
          child: Container(
            height: 70.h,
            width: 70.w,
            decoration: BoxDecoration(
              color: ColorsManager.readingBackGroundColor,
              borderRadius: BorderRadius.circular(SizeManager.radiusLg),
            ),
            child: Center(
              child: Icon(
                Icons.lock_reset_rounded,
                color: ColorsManager.readingTextColor,
                size: 40.sp,
              ),
            ),
          ),
        ),
        SizedBox(height: 20.h),
        Text(
          'Forget password?',
          style: TextStylesManager.displayLarge(
            context,
            fontWeight: FontWeight.w600,
            size: SizeManager.mediumFontSize25,
          ),
        ),
        SizedBox(height: 10.h),
        Text(
          'No worries, enter your email and we\'ll send you a link to reset your password',
          style: TextStylesManager.displaySmall(
            context,
            size: SizeManager.smallFontSize14,
            fontWeight: FontWeight.w500,
            color: ColorsManager.grayTextColor,
          ),
        ),
        SizedBox(height: 30.h),
        Form(
          child: Column(
            children: [
              CustomTextField(
                label: 'Email',
                hint: 'Enter your email',
                onChanged: (data) {},
              ),
            ],
          ),
        ),
        SizedBox(height: 30.h),
        CustomTextButton(
          label: 'Send reset link',
          onPressed: () {
            context.push(Routes.otpPage);
          },
        ),
        SizedBox(height: 30.h),
        InkWell(
          onTap: () {
            context.pop();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.arrow_back_rounded,
                color: ColorsManager.readingTextColor,
                size: 15.h,
              ),
              SizedBox(width: 10.w),
              Text(
                'Back to log in',
                style: TextStylesManager.displaySmall(
                  context,
                  color: ColorsManager.readingTextColor,
                  size: SizeManager.smallFontSize13,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
