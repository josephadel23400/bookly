import 'package:bookly/core/resources/routs_manager.dart';
import 'package:bookly/core/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/resources/colors_manager.dart';
import '../../../../../core/resources/size_manager.dart';
import '../../../../../core/resources/styles_manager.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OtpBody extends StatelessWidget {
  const OtpBody({super.key});

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
                Icons.drafts_outlined,
                color: ColorsManager.readingTextColor,
                size: 40.sp,
              ),
            ),
          ),
        ),

        SizedBox(height: 40.h),

        Text(
          'Verify your email',
          style: TextStylesManager.displayLarge(
            context,
            fontWeight: FontWeight.w600,
            size: SizeManager.mediumFontSize25,
          ),
        ),

        SizedBox(height: 10.h),

        Text(
          'We sent a 4-digit code to alex.johnson@gmail.com',
          maxLines: 2,
          style: TextStylesManager.displaySmall(
            context,
            size: SizeManager.smallFontSize14,
            fontWeight: FontWeight.w500,
            color: ColorsManager.grayTextColor,
          ),
        ),

        SizedBox(height: 50.h),

        OtpTextField(
          numberOfFields: 4,
          keyboardType: TextInputType.number,
          focusedBorderColor: ColorsManager.orangeColor,
          //borderColor: ColorsManager.orangeColor,
          //set to true to show as box or false to show as dash
          showFieldAsBox: true,
          disabledBorderColor: ColorsManager.orangeColor,
          enabledBorderColor: ColorsManager.darkGrayColor,
          fieldWidth: 45.w,
          //runs when a code is typed in
          onCodeChanged: (String code) {
            //handle validation or checks here
          },
          //runs when every textfield is filled
          onSubmit: (String verificationCode) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Verification Code"),
                  content: Text('Code entered is $verificationCode'),
                );
              },
            );
          }, // end onSubmit
        ),

        SizedBox(height: 50.h),
        //todo: switch it to go not push
        CustomTextButton(
          label: 'Confirm',
          onPressed: () {
            context.push(Routes.newPassword);
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
