import 'package:bookly/core/widgets/custom_text_button.dart';
import 'package:bookly/features/auth/sign_up/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/resources/colors_manager.dart';
import '../../../../../core/resources/size_manager.dart';
import '../../../../../core/resources/styles_manager.dart';
import '../../../../../core/widgets/custom_check_box.dart';
import '../../../../../core/widgets/custom_text_field.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignUpCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Create account',
          style: TextStylesManager.displayLarge(
            context,
            fontWeight: FontWeight.w600,
            size: SizeManager.mediumFontSize25,
          ),
        ),
        SizedBox(height: 10.h),
        Text(
          'Start your reading journey today',
          style: TextStylesManager.displaySmall(
            context,
            size: SizeManager.smallFontSize14,
            fontWeight: FontWeight.w500,
            color: ColorsManager.grayTextColor,
          ),
        ),
        SizedBox(height: 40.h),
        Form(
          child: Column(
            children: [
              CustomTextField(
                label: 'Full name',
                hint: 'Enter your full name',
                onChanged: (data) {},
              ),
              SizedBox(height: 20.h),
              CustomTextField(
                label: 'Email',
                hint: 'Enter your email',
                onChanged: (data) {},
              ),
              BlocBuilder<SignUpCubit, SignUpState>(
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
            ],
          ),
        ),
        SizedBox(height: 20.h),
        BlocBuilder<SignUpCubit, SignUpState>(
          builder: (context, state) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomCheckbox(
                  value: cubit.agreedToTerms,
                  onChanged: (value) => cubit.toggleAgreedToTerms(value),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      style: TextStylesManager.displaySmall(
                        size: SizeManager.smallFontSize13,
                        context,
                        color: ColorsManager.grayTextColor,
                      ),
                      children: [
                        const TextSpan(text: 'I agree to the '),
                        TextSpan(
                          text: 'Terms of Service',
                          style: TextStyle(color: ColorsManager.orangeColor),
                          recognizer: TapGestureRecognizer(),
                        ),
                        const TextSpan(text: ' and '),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: TextStyle(color: ColorsManager.orangeColor),
                          recognizer: TapGestureRecognizer(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
        SizedBox(height: 20.h),
        CustomTextButton(label: 'Create account', onPressed: () {}),
        SizedBox(height: 20.h),
        Align(
          alignment: AlignmentGeometry.center,
          child: Text.rich(
            style: TextStylesManager.displaySmall(
              context,
              size: SizeManager.smallFontSize15,
              color: ColorsManager.grayTextColor,
            ),
            TextSpan(
              children: [
                TextSpan(text: 'Already have an account? '),
                TextSpan(
                  text: 'Log in',
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      context.pop();
                    },
                  style: TextStylesManager.displaySmall(
                    context,
                    color: ColorsManager.orangeColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
