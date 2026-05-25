import 'package:bookly/core/app/app_cubit/app_cubit.dart';
import 'package:bookly/core/data/book_model.dart';
import 'package:bookly/core/resources/colors_manager.dart';
import 'package:bookly/core/resources/size_manager.dart';
import 'package:bookly/core/resources/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/resources/routs_manager.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    final BookModel book = context.read<AppCubit>().state.selectedBook!;
    return Container(
      width: SizeManager.screenSizeW100,
      padding: EdgeInsets.only(right: 30.w, left: 30.w, top: 15.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(SizeManager.radiusMd),
            child: Image.asset(
              fit: BoxFit.fill,
              book.image!,
              height: 250.h,
              width: 162.w,
            ),
          ),
          SizedBox(height: 25.h),
          Text(
            book.bookName!,
            textAlign: TextAlign.center,
            style: TextStylesManager.titleMedium(
              context,
              size: SizeManager.largeFontSize30,
            ),
          ),
          SizedBox(height: 5.h),

          Text(
            book.author!,
            style: TextStylesManager.displaySmall(
              fontWeight: FontWeight.w400,
              context,
              color: ColorsManager.whiteColor.withValues(alpha: .5),
            ),
          ),
          SizedBox(height: 15.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 5.0.w),
                child: Icon(
                  Icons.star_rate_rounded,
                  color: ColorsManager.yellowColor,
                  size: 19.h,
                ),
              ),
              Text(
                '${book.rate!}',
                style: TextStylesManager.displaySmall(
                  context,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(width: 5.w),
              Text(
                '${book.reviews!}',
                style: TextStylesManager.displaySmall(
                  context,
                  size: SizeManager.smallFontSize13,
                  color: ColorsManager.whiteColor.withValues(alpha: .5),
                ),
              ),
            ],
          ),
          SizedBox(height: 30.h),
          Hero(
            tag: 'preview',
            child: Material(
              child: Container(
                //padding: EdgeInsets.only(top: 30.h),
                decoration: BoxDecoration(
                  color: ColorsManager.whiteColor,
                  borderRadius: BorderRadius.circular(SizeManager.radiusFull),
                ),
                child: GestureDetector(
                  onTap: () {
                    context.push(Routes.previewBook);

                    // your action here
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Left: Price

                      // Right: Button
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        child: Text(
                          '${book.price}€',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 22,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFFE8826A), // salmon/coral color
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: Text(
                          'Free preview',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ],
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
