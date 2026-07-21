import 'package:bookly/core/resources/assets_manager.dart';
import 'package:bookly/core/resources/colors_manager.dart';
import 'package:bookly/core/resources/routs_manager.dart';
import 'package:bookly/core/resources/size_manager.dart';
import 'package:bookly/core/resources/styles_manager.dart';
import 'package:bookly/core/widgets/custom_elevated_icon_button.dart';
import 'package:bookly/core/widgets/custom_text_button.dart';
import 'package:bookly/core/widgets/custom_text_field.dart';
import 'package:bookly/features/auth/log_in/manager/log_in_cubit/log_in_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LogInBody extends StatelessWidget {
  const LogInBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LogInCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome back',
          style: TextStylesManager.displayLarge(
            context,
            fontWeight: FontWeight.w600,
            size: SizeManager.mediumFontSize25,
          ),
        ),
        SizedBox(height: 10.h),
        Text(
          'Log in to continue reading',
          style: TextStylesManager.displaySmall(
            context,
            fontWeight: FontWeight.w500,
            color: ColorsManager.grayTextColor,
          ),
        ),

        SizedBox(height: 40.h),
        Form(
          child: Column(
            children: [
              CustomTextField(
                label: 'Email',
                onChanged: (data) {},
                hint: 'Enter your email',
              ),
              SizedBox(height: 20.h),
              BlocBuilder<LogInCubit, LogInState>(
                builder: (context, state) {
                  return CustomTextField(
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
                    hint: 'Enter your password',
                  );
                },
              ),
            ],
          ),
        ),
        SizedBox(height: 20.h),
        Align(
          alignment: AlignmentGeometry.centerRight,
          child: InkWell(
            onTap: () {
              context.push(Routes.forgetPasswordPage);
            },
            child: Text(
              'Forget password?',
              style: TextStylesManager.displaySmall(
                context,
                size: SizeManager.smallFontSize14,
                color: ColorsManager.orangeColor,
              ),
            ),
          ),
        ),
        SizedBox(height: 30.h),

        CustomTextButton(
          label: 'Log in',
          onPressed: () {
            context.go(Routes.booksPage);
          },
        ),
        SizedBox(height: 30.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Divider(height: 1, color: ColorsManager.darkGrayColor),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Text(
                'or continue with',
                style: TextStylesManager.displaySmall(
                  context,
                  size: SizeManager.smallFontSize13,
                  color: ColorsManager.grayTextColor.withValues(alpha: .5),
                ),
              ),
            ),
            Expanded(
              child: Divider(height: 1, color: ColorsManager.darkGrayColor),
            ),
          ],
        ),
        SizedBox(height: 30.h),
        Row(
          children: [
            Expanded(
              child: CustomElevatedIconButton(
                imageSize: 20.w,
                image: ImageManager.googleImage,
                iconColor: ColorsManager.whiteColor,
                onPressed: () {},
                backgroundColor: ColorsManager.primaryBackgroundColor,
              ),
            ),
            SizedBox(width: 20.w),
            Expanded(
              child: CustomElevatedIconButton(
                imageSize: 20.w,
                image: ImageManager.appleImage,
                onPressed: () {},
                iconColor: ColorsManager.whiteColor,
                backgroundColor: ColorsManager.primaryBackgroundColor,
              ),
            ),
          ],
        ),
        SizedBox(height: 40.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Don\'t have and account? ',
              style: TextStylesManager.displaySmall(
                context,
                size: SizeManager.smallFontSize15,
                color: ColorsManager.grayTextColor,
              ),
            ),
            InkWell(
              onTap: () {
                context.push(Routes.signUpPage);
              },
              child: Text(
                'Sign up',
                style: TextStylesManager.displaySmall(
                  context,
                  size: SizeManager.smallFontSize15,
                  color: ColorsManager.orangeColor,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
