import 'package:bookly/features/splash_screen/manager/splash_cubit/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashBottomSheetWidget extends StatelessWidget {
  const SplashBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 60,
      alignment: Alignment.center,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          SizedBox(width: 15,),
          GestureDetector(
            child: Icon(Icons.keyboard_arrow_left, size: 35),
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
            child: Icon(Icons.keyboard_arrow_right, size: 35),
            onTap: () {
              context.read<SplashCubit>().nextPage();
            },
          ),
          SizedBox(width: 15,)
        ],
      ),
    );
  }
}
