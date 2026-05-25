import 'package:bookly/core/data/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/colors_manager.dart';
import '../../../../../core/resources/size_manager.dart';
import '../../../../../core/resources/styles_manager.dart';

class BookPreviewInfoPart extends StatelessWidget {
  const BookPreviewInfoPart({super.key, required this.book});
  final BookModel book ;

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Row(
        children: [
          Image.asset(book.image!, height: 113.h, width: 71.w),
          SizedBox(width: 15.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book.bookName!,
                  maxLines: 2,                        // 👈 max 2 lines
                  overflow: TextOverflow.ellipsis,
                  style: TextStylesManager.displayMedium(
                    context,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 7.h),

                Text(
                  book.author!,
                  style: TextStylesManager.displaySmall(
                    context,
                    size: SizeManager.smallFontSize13,
                    fontWeight: FontWeight.w600,
                    color: ColorsManager.whiteColor.withValues(alpha: .6),
                  ),
                ),
                SizedBox(height: 7.h),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorsManager.orangeColor,
                      ),
                      child: Text(
                        'USD  ${book.price!}',
                        style: TextStylesManager.displayMedium(
                          context,
                          fontWeight: FontWeight.w700,
                          size: SizeManager.smallFontSize16,
                          color: ColorsManager.whiteColor.withValues(alpha: .8),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
