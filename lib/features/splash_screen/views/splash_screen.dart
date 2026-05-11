import 'dart:ui';

import 'package:bookly/core/resources/colors_manager.dart';
import 'package:bookly/features/splash_screen/views/widgets/splash_bottom_seet_widget.dart';
import 'package:bookly/features/splash_screen/views/widgets/splash_screen_body.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.primaryBackgroundColor,
      body: Stack(
        children: [
          SplashScreenBody(),
          Positioned(
            bottom: 24,
            left: 60,
            right: 60,
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(color: Colors.white.withOpacity(0.18)),
                    ),
                    child: const SplashBottomSheetWidget(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
