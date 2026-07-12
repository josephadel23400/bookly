import 'package:bookly/core/resources/assets_manager.dart';
import 'package:bookly/core/resources/colors_manager.dart';
import 'package:bookly/core/resources/size_manager.dart';
import 'package:bookly/core/resources/styles_manager.dart';
import 'package:bookly/features/profile/manager/profile_cubit/profile_cubit.dart';
import 'package:bookly/features/profile/views/widgets/genre_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/resources/routs_manager.dart';
import 'custom_profile_card.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 30.h, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 50.r,
                  child: ClipOval(
                    child: Image.asset(
                      ImageManager.profileImage,
                      fit: BoxFit.cover,
                      width: 100.r,
                      height: 100.r,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15.h),
                  child: Text(
                    'Alex Johnson',
                    style: TextStylesManager.displayLarge(
                      context,
                      fontWeight: FontWeight.w700,
                      size: SizeManager.mediumFontSize25,
                    ),
                  ),
                ),
                SizedBox(height: 7.h),
                Text(
                  'alex.johnson@gmail.com',
                  style: TextStylesManager.displaySmall(
                    context,
                    fontWeight: FontWeight.w500,
                    color: ColorsManager.grayTextColor.withValues(alpha: .6),
                    //size: SizeManager.mediumFontSize25,
                  ),
                ),
                SizedBox(height: 10.h),
                Divider(color: ColorsManager.dividerColor),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.h, ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '24',
                            style: TextStylesManager.displayLarge(
                              context,
                              fontWeight: FontWeight.w700,
                              size: SizeManager.mediumFontSize25,
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            'Books Read',
                            style: TextStylesManager.displaySmall(
                              context,
                              fontWeight: FontWeight.w500,
                              size: SizeManager.smallFontSize13,
                              color: ColorsManager.grayTextColor.withValues(
                                alpha: .6,
                              ),
                            ),
                          ),

                          //size: SizeManager.mediumFontSize25,
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '5',
                            style: TextStylesManager.displayLarge(
                              context,
                              fontWeight: FontWeight.w700,
                              size: SizeManager.mediumFontSize25,
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            'Saved',
                            style: TextStylesManager.displaySmall(
                              context,
                              fontWeight: FontWeight.w500,
                              size: SizeManager.smallFontSize13,
                              color: ColorsManager.grayTextColor.withValues(
                                alpha: .6,
                              ),
                            ),
                          ),

                          //size: SizeManager.mediumFontSize25,
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '2',
                            style: TextStylesManager.displayLarge(
                              context,
                              fontWeight: FontWeight.w700,
                              size: SizeManager.mediumFontSize25,
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            'Reading',
                            style: TextStylesManager.displaySmall(
                              context,
                              fontWeight: FontWeight.w500,
                              size: SizeManager.smallFontSize13,
                              color: ColorsManager.grayTextColor.withValues(
                                alpha: .6,
                              ),
                            ),
                          ),

                          //size: SizeManager.mediumFontSize25,
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(color: ColorsManager.dividerColor),
                Padding(
                  padding: EdgeInsets.only(top: 15.h, bottom: 20.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: AlignmentGeometry.centerLeft,
                        child: Text(
                          'Favorite Genres',
                          style: TextStylesManager.displayMedium(
                            context,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      BlocBuilder<ProfileCubit, ProfileState>(
                        builder: (context, state) {
                          return (state is ProfileChangingGenre)
                              ? InkWell(
                                  onTap: () {
                                    context
                                        .read<ProfileCubit>()
                                        .submitGenreChange();
                                  },
                                  child: Text(
                                    'Submit',
                                    style: TextStylesManager.displaySmall(
                                      context,
                                      color: ColorsManager.orangeColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                )
                              : const SizedBox.shrink(); // 👈 show nothing when not in that state
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              return Wrap(
                spacing: 10.w,
                runSpacing: 15.h,
                children: context
                    .read<ProfileCubit>()
                    .genres
                    .map(
                      (genre) => GestureDetector(
                        onTap: () {
                          context.read<ProfileCubit>().changeGenres(genre);
                        },
                        child: GenreChip(
                          isSelected: context
                              .read<ProfileCubit>()
                              .selectedGenres
                              .contains(genre),
                          label: genre,
                        ),
                      ),
                    )
                    .toList(),
              );
            },
          ),
          SizedBox(height: 30.h),
          CustomProfileCard(
            cardName: 'Edit Profile',
            onTap: () {
              context.push(Routes.editProfilePage);
            },
            icon: Icons.person_outline,
          ),
          Divider(color: ColorsManager.dividerColor),
          CustomProfileCard(
            cardName: 'Notification',
            onTap: () {
              context.push(Routes.notificationsPage);
            },
            icon: Icons.notifications_none_rounded,
          ),
          Divider(color: ColorsManager.dividerColor),
          CustomProfileCard(
            cardName: 'Privacy & Security',
            onTap: () {
              context.push(Routes.privacyAndSecurityPage);
            },
            icon: Icons.lock_outline_rounded,
          ),
          Divider(color: ColorsManager.dividerColor),
          CustomProfileCard(
            isOrange: true,
            cardName: 'Log Out',
            onTap: () {},
            icon: Icons.logout,
          ),
          Divider(color: ColorsManager.dividerColor),
          SizedBox(height: 90.h),
        ],
      ),
    );
  }
}
