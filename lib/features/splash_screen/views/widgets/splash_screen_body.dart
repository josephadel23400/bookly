import 'package:bookly/core/resources/colors_manager.dart';
import 'package:bookly/features/splash_screen/manager/splash_cubit/splash_cubit.dart';
import 'package:bookly/features/splash_screen/views/widgets/slider_first_page.dart';
import 'package:bookly/features/splash_screen/views/widgets/slider_second_page.dart';
import 'package:bookly/features/splash_screen/views/widgets/slider_third_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreenBody extends StatelessWidget {
  const SplashScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<SplashCubit, SplashState>(
        builder: (context, state) {
          return PageView(
            controller: context.read<SplashCubit>().controller,
            onPageChanged: (index) {
              index = context.read<SplashCubit>().pageNum;
            },
            children: [
              SliderFirstPage(),
              SliderSecondPage(),
              SliderThirdPage(),
            ],
          );
        },
      );
  }
}
