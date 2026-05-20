import 'dart:ui';

import 'package:bookly/core/resources/colors_manager.dart';
import 'package:bookly/core/resources/size_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookshelfCard extends StatelessWidget {
  const BookshelfCard({super.key, required this.image, required this.bookId});
  final  String image;
  final  int bookId;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadiusGeometry.circular(SizeManager.radiusSm),
      ),
      child: Stack(
        children: [
          Positioned(
            right: 5.w,
            bottom: 10.h,
            child: IconButton(
              color: ColorsManager.whiteColor,
              onPressed: () {
                print('nigga $bookId');
              },
              icon: ClipRRect(
                borderRadius: BorderRadius.circular(SizeManager.radiusFull),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                  child: Container(
                    height: 40.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusGeometry.circular(
                        SizeManager.radiusFull,
                      ),
                    ),

                    child: Icon(Icons.play_arrow_rounded, size: 20.sp),
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
