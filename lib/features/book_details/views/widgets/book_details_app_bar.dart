import 'package:bookly/core/resources/size_manager.dart';
import 'package:bookly/core/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class BookDetailsAppBar extends StatelessWidget {
  const BookDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      width: SizeManager.screenSizeW100,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomIconButton(
            onPressed: () {
              print('we are closing ');
              context.pop();
              print('we closed  ');

            },
            icon: Icons.close_rounded,
            size: 30.h,
          ),
          Spacer(),
          CustomIconButton(
            onPressed: () {},
            icon: Icons.bookmark_outlined,
            size: 25.h,
          ),
          CustomIconButton(
            onPressed: () {},
            icon: Icons.shopping_cart_outlined,
            size: 25.h,
          ),
        ],
      ),
    );
  }
}
