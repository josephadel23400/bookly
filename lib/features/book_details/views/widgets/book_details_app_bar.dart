import 'package:bookly/core/app/app_cubit/app_cubit.dart';
import 'package:bookly/core/resources/size_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/colors_manager.dart';

class BookDetailsAppBar extends StatelessWidget {
  const BookDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 13.w),
      height: 65.h,
      width: SizeManager.screenSizeW100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundColor: ColorsManager.darkGrayColor,
            radius: 25.r,
            //foregroundColor: ColorsManager.darkGrayColor,
            child: IconButton(
              onPressed: () {
                context.read<AppCubit>().goBack();
                context.pop();
              },
              icon: Icon(
                size: 22.h,

                Icons.arrow_back,
                color: ColorsManager.whiteColor,
              ),
            ),
          ),

          Text(
              'Book Details',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: ColorsManager.whiteColor.withValues(alpha: .7),
              fontSize: SizeManager.smallFontSize14,
            ),
          ),
          CircleAvatar(
            backgroundColor: ColorsManager.darkGrayColor,
            radius: 25.r,
            child: PopupMenuButton(
              constraints: BoxConstraints(
                minWidth: 130.w,
                maxWidth: 130.w,
              ), // 👈 control width

              icon: Icon(
                Icons.more_horiz,
                size: 22.h,
                color: ColorsManager.whiteColor,
              ),
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 'bookmark',
                  child: SizedBox(
                    width: 101.w,
                    child: Row(
                      children: [
                        Icon(
                          Icons.bookmark_border,
                          color: ColorsManager.whiteColor,
                        ),
                        SizedBox(width: 4),
                        Text('Bookmark'),
                      ],
                    ),
                  ),
                ),
                PopupMenuItem(
                  value: 'cart',
                  child: SizedBox(
                    width: 101.w,
                    child: Row(
                      children: [
                        Icon(
                          Icons.shopping_cart_outlined,
                          color: ColorsManager.whiteColor,
                        ),
                        SizedBox(width: 4),
                        Text('Shop Cart'),
                      ],
                    ),
                  ),
                ),
              ],
              onSelected: (value) {
                // handle selection
              },
            ),
          ),
        ],
      ),
    );
  }
}
