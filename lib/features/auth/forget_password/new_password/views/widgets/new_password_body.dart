import 'package:bookly/core/resources/routs_manager.dart' as new_password_body;
import 'package:bookly/core/widgets/custom_text_button.dart';
import 'package:bookly/core/widgets/custom_text_field.dart';
import 'package:bookly/features/auth/forget_password/new_password/manager/new_password_cubit/new_password_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/resources/colors_manager.dart';
import '../../../../../../core/resources/size_manager.dart';
import '../../../../../../core/resources/styles_manager.dart';



class NewPasswordBody extends StatelessWidget {
  const NewPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<NewPasswordCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 40.h),
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
                Icons.password_outlined,
                color: ColorsManager.readingTextColor,
                size: 40.sp,
              ),
            ),
          ),
        ),
        SizedBox(height: 20.h),
        Text(
          'New password',
          style: TextStylesManager.displayLarge(
            context,
            fontWeight: FontWeight.w600,
            size: SizeManager.mediumFontSize25,
          ),
        ),
        SizedBox(height: 10.h),
        Text(
          'Enter your new password',
          style: TextStylesManager.displaySmall(
            context,
            size: SizeManager.smallFontSize14,
            fontWeight: FontWeight.w500,
            color: ColorsManager.grayTextColor,
          ),
        ),
        SizedBox(height: 50.h),
        Form(
          child:BlocBuilder<NewPasswordCubit, NewPasswordState>(
            builder: (context, state) {
              return Column(
                children: [
                  SizedBox(height: 20.h),
                  CustomTextField(
                    label: 'Password',
                    obscureText: cubit.isPasswordObscured,
                    suffixIcon: GestureDetector(
                      onTap: cubit.togglePasswordVisibility,
                      child: Icon(
                        cubit.isPasswordObscured
                            ? CupertinoIcons.eye_slash
                            : CupertinoIcons.eye,
                      ),
                    ),
                    onChanged: (data) {},
                    hint: 'Create your password',
                  ),
                  SizedBox(height: 20.h),
                  CustomTextField(
                    label: 'Confirm password',
                    obscureText: cubit.isConfirmPasswordObscured,
                    suffixIcon: GestureDetector(
                      onTap: cubit.toggleConfirmPasswordVisibility,
                      child: Icon(
                        cubit.isConfirmPasswordObscured
                            ? CupertinoIcons.eye_slash
                            : CupertinoIcons.eye,
                      ),
                    ),
                    onChanged: (data) {},
                    hint: 'Re-enter your password',
                  ),
                ],
              );
            },
          ),
        ),
        SizedBox(height: 50.h),
        CustomTextButton(
          label: 'Confirm',
          onPressed: () {
           // context.push();
          },
        ),
        SizedBox(height: 30.h),


        Align(alignment: AlignmentGeometry.center,
          child: Text(
            'If you remember your old password',
            style: TextStylesManager.displaySmall(
              context,
              color: ColorsManager.grayTextColor,
              size: SizeManager.smallFontSize13,
            ),
          ),
        ),
        SizedBox(height: 15.h),
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
