import 'package:bookly/features/profile/notifications/manager/notifications_cubit/notifications_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/colors_manager.dart';
import '../../../../../core/resources/styles_manager.dart';
import '../../../../../core/widgets/custom_notification_tile.dart';

class NotificationsBody extends StatelessWidget {
  const NotificationsBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<NotificationsCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 12.h),
        Text(
          'General',
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
          child: BlocBuilder<NotificationsCubit, NotificationsState>(
            builder: (context, state) {
              return Column(
                children: [
                  CustomNotificationTile(
                    icon: Icons.notifications_outlined,
                    label: 'Push notifications',
                    value: cubit.valueOf(NotificationKeys.push),
                    onChanged: (value) {
                      cubit.toggle(NotificationKeys.push, value);
                    },
                  ),
                  Divider(color: ColorsManager.darkGrayColor, height: 1),
                  CustomNotificationTile(
                    icon: Icons.mail_outline,
                    label: 'Email notifications',
                    value: cubit.valueOf(NotificationKeys.email),
                    onChanged: (value) {
                      cubit.toggle(NotificationKeys.email, value);
                    },
                  ),
                ],
              );
            },
          ),
        ),
        SizedBox(height: 25.h),
        Text(
          'Reading updates ',
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
          child: BlocBuilder<NotificationsCubit, NotificationsState>(
            builder: (context, state) {
              return Column(
                children: [
                  CustomNotificationTile(
                    label: 'New book releases',
                    value: cubit.valueOf(NotificationKeys.newReleases),
                    onChanged: (value) {
                      cubit.toggle(NotificationKeys.newReleases, value);
                    },
                  ),
                  Divider(color: ColorsManager.darkGrayColor, height: 1),
                  CustomNotificationTile(
                    label: 'Reading reminders',
                    value: cubit.valueOf(NotificationKeys.readingReminders),
                    onChanged: (value) {
                      cubit.toggle(NotificationKeys.readingReminders, value);
                    },
                  ),
                  Divider(color: ColorsManager.darkGrayColor, height: 1),
                  CustomNotificationTile(
                    label: 'Recommendations',
                    value: cubit.valueOf(NotificationKeys.recommendations),
                    onChanged: (value) {
                      cubit.toggle(NotificationKeys.recommendations, value);
                    },
                  ),
                ],
              );
            },
          ),
        ),
        SizedBox(height: 25.h),
        Text(
          'Community ',
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
          child: BlocBuilder<NotificationsCubit, NotificationsState>(
            builder: (context, state) {
              return CustomNotificationTile(
                label: 'Friend activity',
                value: cubit.valueOf(NotificationKeys.friendActivity),
                onChanged: (value) {
                  cubit.toggle(NotificationKeys.friendActivity, value);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
