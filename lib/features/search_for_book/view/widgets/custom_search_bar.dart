import 'package:bookly/core/resources/assets_manager.dart';
import 'package:bookly/core/resources/size_manager.dart';
import 'package:bookly/core/widgets/search_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/book_listview.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        width: SizeManager.screenSizeW100,
        height: 140.h,
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: Icon(CupertinoIcons.back, size: 30.w),
                ),
                SvgPicture.asset(
                  ImageManager.logoSvg,
                  height: 20.h,
                  width: 50.w,
                ),
              ],
            ),
            SizedBox(
              height: 90.h,
              width: SizeManager.screenSizeW100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        suffixIcon: SearchButton(onPressed: () {}),
                        hintText: 'Write The  Book Name ',
                        filled: true,
                        fillColor: Colors.white.withValues(alpha: .3),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            SizeManager.radiusFull,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
