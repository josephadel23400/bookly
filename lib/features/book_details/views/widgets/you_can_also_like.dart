import 'package:bookly/core/app/app_cubit/app_cubit.dart';
import 'package:bookly/core/resources/routs_manager.dart';
import 'package:bookly/core/resources/size_manager.dart';
import 'package:bookly/core/resources/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/data/book_model.dart';

class YouCanAlsoLike extends StatelessWidget {
  const YouCanAlsoLike({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 182.h,
      width: SizeManager.screenSizeW100,
      padding: EdgeInsets.only(left: 20.w, top: 25.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'You may also like',
            style: TextStylesManager.displaySmall(context),
          ),
          SizedBox(height: 20.h),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: books.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(right: 8.w),
                  child: GestureDetector(
                    onTap: () {
                      context.read<AppCubit>().selectBook(books[index]);
                      context.push(Routes.bookDetails);
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(
                        SizeManager.radiusMd,
                      ),
                      child: Image.asset(
                        fit: BoxFit.fill,
                        books[index].image!,
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
