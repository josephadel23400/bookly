import 'package:bookly/core/resources/colors_manager.dart';
import 'package:bookly/core/resources/size_manager.dart';
import 'package:bookly/core/resources/styles_manager.dart';
import 'package:bookly/features/saved_books/views/widgets/saved_book_card_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/data/book_model.dart';

class SavedBooksBody extends StatelessWidget {
  const SavedBooksBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Saved Books',
              style: TextStylesManager.displayMedium(
                context,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 15.h),
            Text(
              '5 books saved',
              style: TextStylesManager.displaySmall(
                context,
                size: SizeManager.smallFontSize14,
                fontWeight: FontWeight.w500,
                color: ColorsManager.whiteColor.withValues(alpha: .6),
              ),
            ),
            SizedBox(height: 25.h),
            Expanded(
              child: ListView.builder(
                itemCount: books.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      SavedBookCardView(book: books[index]),
                      Divider(
                        color: ColorsManager.whiteColor.withValues(alpha: .1),
                      ),
                      SizedBox(height: 10.h),
                      if (index == books.length - 1) SizedBox(height: 80.h,),
                    ],
                  );
                },
              ),
            ),
            //SizedBox(height: 100.h),
          ],
        ),
      ),
    );
  }
}
