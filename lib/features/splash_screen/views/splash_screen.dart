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
        body: const Stack(
          children: [SplashScreenBody(), SplashBottomSheetWidget()],
        ),
      ),
    );
  }
}
