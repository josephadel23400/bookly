import 'package:bookly/core/resources/size_manager.dart';
import 'package:bookly/core/resources/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/assets_manager.dart';

class YouCanAlsoLike extends StatelessWidget {
  const YouCanAlsoLike({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> list = [
      ImageManager.bookI3mage,
      ImageManager.bookI2mage,
      ImageManager.bookImage,
      ImageManager.bookI2mage,
      ImageManager.bookI3mage,
      ImageManager.bookImage,
      ImageManager.bookI2mage,
      ImageManager.bookI3mage,
      ImageManager.bookImage,
      ImageManager.bookI2mage,
      ImageManager.bookI3mage,
    ];
    return Container(
      height: 182.h,
      width: SizeManager.screenSizeW100,
      padding: EdgeInsets.only(left: 20.w, top: 25.h,),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'You can also like',
            style: TextStylesManager.displaySmall(context),
          ),
          SizedBox(height: 20.h,),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: list.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:  EdgeInsets.only(right: 8.w),
                  child: GestureDetector(
                    onTap: () {},
                    child: ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(
                        SizeManager.radiusMd,
                      ),
                      child: Image.asset(
                        list[index],
                        height: 112.h,
                        width: 75.w,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
