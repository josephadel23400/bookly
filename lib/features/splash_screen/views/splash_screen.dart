import 'dart:ui';
import 'package:bookly/core/resources/colors_manager.dart';
import 'package:bookly/core/resources/size_manager.dart';
import 'package:bookly/features/splash_screen/views/widgets/splash_bottom_seet_widget.dart';
import 'package:bookly/features/splash_screen/views/widgets/splash_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        
        body: Stack(
          children: [
            SplashScreenBody(),
            Positioned(
              bottom: 24.h,
              left: 60.w,
              right: 60.w,
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(SizeManager.radiusFull),
                        border: Border.all(color: ColorsManager.whiteColor.withValues(alpha: 0.18)),
                      ),
                      child: const SplashBottomSheetWidget(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
