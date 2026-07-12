import 'dart:math';
import 'package:bookly/core/data/book_model.dart';
import 'package:bookly/core/data/pdf_data_model.dart';
import 'package:bookly/core/resources/assets_manager.dart';
import 'package:bookly/core/resources/routs_manager.dart';
import 'package:bookly/core/resources/size_manager.dart';
import 'package:bookly/core/resources/styles_manager.dart';
import 'package:bookly/features/user_book_details/manager/user_book_details_cubit/user_book_details_cubit.dart';
import 'package:bookly/features/user_book_details/views/widgets/chapteer_card.dart';
import 'package:bookly/features/user_book_details/views/widgets/data_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/data/user_book_model.dart';
import '../../../../core/resources/colors_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBookDetailsBody extends StatelessWidget {
  const UserBookDetailsBody({
    super.key,
    required this.book,
    required this.bookStatus,
  });
  final BookModel book;
  final UserBookModel bookStatus;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBookDetailsCubit, UserBookDetailsState>(
      builder: (context, state) {
        if (state is UserBookDetailsLoading) {
          print('loading indicator \n');
          return const Center(child: CircularProgressIndicator());
        } else if (state is UserBookDetailsSuccess) {
          print('data loaded \n');

          PdfDataModel pdf = context.read<UserBookDetailsCubit>().pdfData;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(
                  SizeManager.radiusSm,
                ),
                child: Image.asset(book.image!, height: 190.h),
              ),
              SizedBox(height: 15.h),
              Text(
                '${book.bookName}',
                style: TextStylesManager.displayMedium(context),
              ),
              SizedBox(height: 5.h),
              Text(
                '${book.author}',
                style: TextStylesManager.displaySmall(
                  context,
                  color: ColorsManager.whiteColor.withValues(alpha: .7),
                ),
              ),
              SizedBox(height: 15.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DataCard(text1: '4.8', text2: 'Rating', withStar: true),
                    DataCard(text1: '${pdf.pageCount!}', text2: 'Pages'),
                    DataCard(
                      text1: '${pdf.bookMarks!.count}',
                      text2: 'Chapters',
                    ),
                    DataCard(text1: pdf.readTime!, text2: 'Read time'),
                  ],
                ),
              ),
              SizedBox(height: 15.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Reading progress',
                      style: TextStylesManager.displaySmall(
                        context,
                        fontWeight: FontWeight.w600,

                        size: SizeManager.smallFontSize14,
                        color: ColorsManager.whiteColor.withValues(alpha: .7),
                      ),
                    ),
                    Text(
                      '${bookStatus.readingPercentage * 100.toInt()}%',
                      style: TextStylesManager.displaySmall(
                        context,
                        fontWeight: FontWeight.w600,
                        size: SizeManager.smallFontSize14,
                        color: ColorsManager.readingTextColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: LinearProgressIndicator(
                  value: bookStatus.readingPercentage,
                  color: ColorsManager.readingTextColor,
                  backgroundColor: ColorsManager.linearProgressBackGroundColor,
                  borderRadius: BorderRadius.circular(8.r), // rounded edges
                  minHeight: 8.h, // thickness
                ),
              ),
              SizedBox(height: 5.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Chapter 18 of 30',
                      style: TextStylesManager.displaySmall(
                        context,
                        fontWeight: FontWeight.w600,
                        size: SizeManager.smallFontSize13,
                        color: ColorsManager.whiteColor.withValues(alpha: .5),
                      ),
                    ),
                    Text(
                      '4h left',
                      style: TextStylesManager.displaySmall(
                        context,
                        fontWeight: FontWeight.w600,
                        size: SizeManager.smallFontSize12,
                        color: ColorsManager.whiteColor.withValues(alpha: .5),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                child: Divider(color: ColorsManager.dividerColor),
              ),
              SizedBox(height: 10.h),
              ElevatedButton(
                onPressed: () {
                  context.push(Routes.bookReadingPage);
                },
                style: ButtonStyle(
                  minimumSize: WidgetStatePropertyAll(
                    Size(SizeManager.screenSizeW90, 70.h),
                  ),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(SizeManager.radiusSm),
                    ),
                  ),
                  backgroundColor: WidgetStateProperty.all(
                    ColorsManager.readingTextColor,
                  ),
                  foregroundColor: WidgetStateProperty.all(
                    ColorsManager.whiteColor,
                  ),
                ),
                child: Column(
                  children: [
                    SvgPicture.asset(
                      ImageManager.emptyBookIconSVG,
                      height: 25.h,
                      color: ColorsManager.whiteColor,
                    ),

                    Text(
                      'Continue reading',
                      style: TextStylesManager.displaySmall(
                        context,
                        fontWeight: FontWeight.w600,
                        size: SizeManager.smallFontSize16,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.h),
              Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: Align(
                  alignment: AlignmentGeometry.centerLeft,
                  child: Text(
                    'CHAPTERS',
                    style: TextStylesManager.displaySmall(
                      context,
                      fontWeight: FontWeight.w700,
                      size: SizeManager.smallFontSize14,
                      color: ColorsManager.whiteColor.withValues(alpha: .7),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5.h),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                  child: ListView.builder(
                    itemCount: pdf.bookMarks!.count,
                    itemBuilder: (context, index) {
                      return ChapterCard(
                        status: 'still',
                        chapterNum: index + 1,
                        pages: index + Random().nextInt(50),
                        title: pdf.bookMarks![index].title,
                        onTap: () {},
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        } else if (state is UserBookDetailsFailer) {
          return Center(child: Text(state.error));
        } else {
          return Container();
        }
      },
    );
  }
}

List<String> statuses = [
  'complete',
  'complete',
  'complete',
  'complete',
  'complete',
  'complete',
  'complete',
  'complete',
  'complete',
  'complete',
  'complete',
  'complete',
  'complete',
  'complete',
  'complete',
  'complete',
  'complete',
  'reading',
  'still',
  'still',
  'still',
  'still',
  'still',
  'still',
  'still',
  'still',
  'still',
  'still',
  'still',
  'still',
  'still',
  'still',
  'still',
  'still',
  'still',
  'still',
  'still',
  'still',
  'still',
  'still',
  'still',
  'still',
];
