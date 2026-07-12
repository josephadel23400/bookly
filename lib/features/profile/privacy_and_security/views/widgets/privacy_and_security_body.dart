import 'package:bookly/core/widgets/custom_tile.dart';
import 'package:bookly/features/profile/privacy_and_security/manager/privacy_and_security_cubit/privacy_and_security_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/colors_manager.dart';
import '../../../../../core/resources/styles_manager.dart';
import '../../../../../core/widgets/custom_notification_tile.dart';

class PrivacyAndSecurityBody extends StatelessWidget {
  const PrivacyAndSecurityBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PrivacyAndSecurityCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 12.h),
        Text(
          'Account security',
          style: TextStylesManager.displaySmall(
            context,
            color: ColorsManager.grayTextColor,
          ),
        ),
        SizedBox(height: 12.h),
        Container(
          decoration: BoxDecoration(
            color: ColorsManager.textFieldBackgroundColor,
            borderRadius: BorderRadius.circular(16.r),
          ),
          // padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: BlocBuilder<PrivacyAndSecurityCubit, PrivacyAndSecurityState>(
            builder: (context, state) {
              return Column(
                children: [
                  CustomTile(
                    onTap: () {},
                    label: 'Change password',
                    icon: Icons.vpn_key_outlined,
                  ),
                  Divider(color: ColorsManager.darkGrayColor, height: 1),
                  CustomNotificationTile(isSmallerFont: true,
                    icon: Icons.gpp_good_outlined,
                    label: 'Two_factor authentication',
                    value: cubit.valueOf(PrivacyKey.towFactor),
                    onChanged: (value) {
                      cubit.toggle(PrivacyKey.towFactor, value);
                    },
                  ),
                ],
              );
            },
          ),
        ),
        SizedBox(height: 25.h),
        Text(
          'Privacy',
          style: TextStylesManager.displaySmall(
            context,
            color: ColorsManager.grayTextColor,
          ),
        ),
        SizedBox(height: 12.h),
        Container(
          decoration: BoxDecoration(
            color: ColorsManager.textFieldBackgroundColor,
            borderRadius: BorderRadius.circular(16.r),
          ),
          // padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: BlocBuilder<PrivacyAndSecurityCubit, PrivacyAndSecurityState>(
            builder: (context, state) {
              return Column(
                children: [
                  CustomNotificationTile(
                    label: 'Private Profile',
                    value: cubit.valueOf(PrivacyKey.privateProfile),
                    onChanged: (value) {
                      cubit.toggle(PrivacyKey.privateProfile, value);
                    },
                  ),
                  Divider(color: ColorsManager.darkGrayColor, height: 1),
                  CustomNotificationTile(
                    label: 'Show reading activity',
                    value: cubit.valueOf(PrivacyKey.showReadingActivity),
                    onChanged: (value) {
                      cubit.toggle(PrivacyKey.showReadingActivity, value);
                    },
                  ),
                ],
              );
            },
          ),
        ),
        SizedBox(height: 25.h),
        Text(
          'More',
          style: TextStylesManager.displaySmall(
            context,
            color: ColorsManager.grayTextColor,
          ),
        ),
        SizedBox(height: 12.h),
        Container(
          decoration: BoxDecoration(
            color: ColorsManager.textFieldBackgroundColor,
            borderRadius: BorderRadius.circular(16.r),
          ),
          // padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: CustomTile(onTap: () {}, isRed: true, label: 'Delete account'),
        ),
      ],
    );
  }
}
