import 'package:bookly/core/app/app_cubit/app_cubit.dart';
import 'package:bookly/core/data/book_model.dart';
import 'package:bookly/core/helper/dialogs_utils.dart';
import 'package:bookly/core/resources/colors_manager.dart';
import 'package:bookly/core/resources/size_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/routs_manager.dart';
import '../../../../core/resources/styles_manager.dart';

class SavedBookCardView extends StatelessWidget {
  const SavedBookCardView({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<AppCubit>().selectBook(book);
        context.push(Routes.bookDetails);
      },
      child: Container(
        padding: EdgeInsets.only(bottom: 10.h),
        //height: 120.h,
        width: SizeManager.screenSizeW90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              // 👈 use ClipRRect for image
              borderRadius: BorderRadius.circular(SizeManager.radiusSm),
              child: Image.asset(
                book.image!,
                height: 107.h,
                width: 75.w,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(width: 25.w),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    book.bookName!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStylesManager.titleMedium(
                      context,
                      fontWeight: FontWeight.bold,
                      size: SizeManager.mediumFontSize18,
                    ),
                  ),
                  SizedBox(height: 2.h),

                  Text(
                    book.author!,
                    style: TextStylesManager.displaySmall(
                      color: ColorsManager.whiteColor.withValues(alpha: .5),
                      context,
                      fontWeight: FontWeight.w400,
                      size: SizeManager.smallFontSize14,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      Icon(
                        size: 14.h,
                        Icons.star_rate_sharp,
                        color: ColorsManager.yellowColor,
                      ),

                      Text(
                        ' ${book.rate} (${book.reviews!})',
                        style: TextStyle(
                          fontSize: SizeManager.smallFontSize13,
                          fontWeight: FontWeight.w400,
                          color: ColorsManager.whiteColor.withValues(alpha: .5),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    '${book.price!} \$',
                    style: TextStylesManager.displayMedium(
                      context,
                      fontWeight: FontWeight.w700,
                      size: 18.sp,
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: CircleAvatar(
                backgroundColor: ColorsManager.orangeColor,
                child: IconButton(
                  onPressed: () async {
                    await DialogsUtils.showLoadingDialog(
                      context,
                      action: () async {
                        await Future.delayed(Duration(seconds: 1));

                      },
                    );
                    DialogsUtils.showTopToast(
                      context,
                      'Books Removed Successfully',
                    );
                  },
                  icon: Icon(Icons.bookmark, color: ColorsManager.whiteColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
