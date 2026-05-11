import 'package:flutter/material.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/colors_manager.dart';

class SliderThirdPage extends StatelessWidget {
  const SliderThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(ImageManager.bookDetails,width: 270,),
          SizedBox(height: 30),
          Center(
            child: Text(textAlign: TextAlign.center,
              'Buy the book you need and download add it to your library 🔍',
              style: TextStyle(color: ColorsManager.whiteColor, fontSize: 18,),
            ),
          ),
        ],
      ),
    );
  }
}
