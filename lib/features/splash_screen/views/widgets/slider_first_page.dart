import 'package:flutter/material.dart';

import '../../../../core/resources/colors_manager.dart';
import 'bookly_animation.dart';

class SliderFirstPage extends StatelessWidget {
  const SliderFirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BooklyAnimation(),
          SizedBox(height: 100),
          Text(
            'Find Your Book With Bookly ❤️',
            style: TextStyle(color: ColorsManager.whiteColor, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
