import 'package:bookly/core/resources/assets_manager.dart';
import 'package:flutter/material.dart';

import '../../../../core/resources/colors_manager.dart';

class SliderSecondPage extends StatelessWidget {
  const SliderSecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(ImageManager.mainPage,width: 270,),
          SizedBox(height: 30),
          Text(
            'Search in 5000+ and enjoy reading 🔍 ',
            style: TextStyle(color: ColorsManager.whiteColor, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
