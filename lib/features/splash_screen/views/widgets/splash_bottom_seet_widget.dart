import 'dart:ui';

import 'package:bookly/core/resources/colors_manager.dart';
import 'package:bookly/features/splash_screen/manager/splash_cubit/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/size_manager.dart';

class SplashBottomSheetWidget extends StatelessWidget {
  const SplashBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 24.h,
      left: 60.w,
      right: 60.w,
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40.r),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(SizeManager.radiusFull),
                border: Border.all(
                  color: ColorsManager.whiteColor.withValues(alpha: 0.18),
                ),
              ),
              child: Container(
                height: 65.h,
                alignment: Alignment.center,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 15.w),
                    GestureDetector(
                      child: Icon(
                        Icons.keyboard_arrow_left,
                        size: 35.h,
                        color: ColorsManager.whiteColor,
                      ),
                      onTap: () {
                        context.read<SplashCubit>().previousPage();
                      },
                    ),
                    Spacer(),
                    BlocBuilder<SplashCubit, SplashState>(
                      builder: (context, state) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            for (int i = 0; i <= 2; i++)
                              Icon(
                                i == context.read<SplashCubit>().pageNum
                                    ? Icons.circle
                                    : Icons.circle_outlined,
                                color: i == context.read<SplashCubit>().pageNum
                                    ? Colors.white
                                    : Colors.black,
                              ),
                          ],
                        );
                      },
                    ),
                    Spacer(),
                    GestureDetector(
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        size: 35.h,
                        color: ColorsManager.whiteColor,
                      ),
                      onTap: () {
                        context.read<SplashCubit>().nextPage();
                      },
                    ),
                    SizedBox(width: 15.w),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
