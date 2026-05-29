import 'package:bookly/features/book_details/manager/book_details_cubit/book_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/resources/colors_manager.dart';
import '../../../../../core/resources/styles_manager.dart';

class BookPreviewTextPart extends StatelessWidget {
  const BookPreviewTextPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: BlocBuilder<BookDetailsCubit, BookDetailsState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Chapter 1 — Mowgli\'s Brothers',
                    style: TextStylesManager.displaySmall(
                      context,
                      color: ColorsManager.orangeColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  state is BookDetailsReady
                      ? RichText(
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                child: Padding(
                                  padding: EdgeInsets.only(right: 15.0.w),
                                  child: Text(
                                    context
                                        .read<BookDetailsCubit>()
                                        .dropCapLetter
                                        .toUpperCase(), // "D"
                                    style: TextStyle(
                                      fontSize: 64.sp,
                                      fontWeight: FontWeight.bold,
                                      color: ColorsManager.orangeColor,
                                      height: 0.8.h,
                                    ),
                                  ),
                                ),
                              ),
                              TextSpan(
                                text: context
                                    .read<BookDetailsCubit>()
                                    .remainingText, // "isney first made..."
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: ColorsManager.whiteColor,
                                  height: 1.6,
                                ),
                              ),
                            ],
                          ),
                        )
                      : CircularProgressIndicator(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
