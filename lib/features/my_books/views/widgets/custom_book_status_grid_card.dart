import 'package:bookly/core/data/book_model.dart';
import 'package:bookly/core/data/user_book_model.dart';
import 'package:bookly/core/resources/colors_manager.dart';
import 'package:bookly/core/resources/routs_manager.dart';
import 'package:bookly/core/resources/size_manager.dart';
import 'package:bookly/core/resources/styles_manager.dart';
import 'package:bookly/features/my_books/manager/my_books_cubit/my_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../user_book_details/views/user_book_details_page.dart';

class CustomBookStatusGridCard extends StatelessWidget {
  const CustomBookStatusGridCard({
    super.key,
    required this.book,
    required this.bookStatus,
  });
  final BookModel book;
  final UserBookModel bookStatus;
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SizeManager.radiusSm),
        color: ColorsManager.blackDenimColor,
      ),
      child: GestureDetector(
        onTap: () {
          print('\n card has been pressed \n');
          context.read<MyBooksCubit>().appCubit.selectUserBook(
            book,
            bookStatus,
          );
          context.push(Routes.userBookDetails);
          print('\n card has been pressed \n');
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(SizeManager.radiusSm),
                child: Image.asset(
                  book.image!,
                  width: 165.w,
                  //height: 150.h,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    book.bookName!,
                    style: TextStylesManager.displaySmall(
                      context,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    book.author!,
                    textAlign: TextAlign.left,
                    style: TextStylesManager.displaySmall(
                      context,
                      fontWeight: FontWeight.w400,
                      color: ColorsManager.whiteColor.withValues(alpha: .5),
                      size: SizeManager.smallFontSize13,
                    ),
                  ),
                  SizedBox(height: 7.h),

                  LinearProgressIndicator(
                    value: bookStatus.readingPercentage,
                    color: ColorsManager.readingTextColor,
                    backgroundColor:
                        ColorsManager.linearProgressBackGroundColor,
                    borderRadius: BorderRadius.circular(8.r), // rounded edges
                    minHeight: 8.h, // thickness
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    context.read<MyBooksCubit>().getReadingPercentage(
                      bookStatus.readingPercentage,
                    ),
                    style: TextStylesManager.displaySmall(
                      context,
                      fontWeight: FontWeight.w400,
                      color: ColorsManager.whiteColor.withValues(alpha: .5),
                      size: SizeManager.smallFontSize12,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Container(
                    height: 20.h,
                    width: 70.w,
                    decoration: BoxDecoration(
                      color: context
                          .read<MyBooksCubit>()
                          .getReadingPercentageColor(
                            bookStatus.readingPercentage,
                          )[1],
                      borderRadius: BorderRadius.circular(
                        SizeManager.radiusFull,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        context.read<MyBooksCubit>().getReadingStatus(
                          bookStatus.readingPercentage,
                        ),
                        style: TextStylesManager.displaySmall(
                          context,
                          fontWeight: FontWeight.w400,
                          color: context
                              .read<MyBooksCubit>()
                              .getReadingPercentageColor(
                                bookStatus.readingPercentage,
                              )[0],
                          size: SizeManager.smallFontSize12,
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
