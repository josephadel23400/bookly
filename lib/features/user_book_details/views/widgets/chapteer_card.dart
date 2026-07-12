import 'package:bookly/core/resources/colors_manager.dart';
import 'package:bookly/core/resources/size_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/styles_manager.dart';

class ChapterCard extends StatelessWidget {
  const ChapterCard({
    super.key,
    required this.status,
    required this.title,
    required this.pages,
    required this.chapterNum,
    this.onTap,
  });
  final String status;
  final String title;
  final int chapterNum;
  final int pages;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 60.h,
          width: SizeManager.screenSizeW80,
          decoration: BoxDecoration(
            color: ColorsManager.chapterCardBackgroundColor,
            border: Border.all(
              color: status == 'reading'
                  ? ColorsManager.readingTextColor
                  : Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(SizeManager.radiusSm),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                child: Container(
                  height: 35.h,
                  width: 35.w,
                  decoration: BoxDecoration(
                    color: status == 'reading'
                        ? ColorsManager.readingBackGroundColor
                        : status == 'complete'
                        ? ColorsManager.finishedBackGroundColor
                        : ColorsManager.didNotReadYetBackgroundColor,
                    borderRadius: BorderRadius.circular(SizeManager.radiusSm),
                  ),
                  child: Center(
                    child: Text(
                      chapterNum.toString(),
                      style: TextStylesManager.displaySmall(
                        context,
                        fontWeight: FontWeight.w600,
                        size: SizeManager.smallFontSize12,
                        color: status == 'reading'
                            ? ColorsManager.readingTextColor
                            : status == 'complete'
                            ? ColorsManager.finishedTextColor
                            : ColorsManager.didNotReadYetTextColor,
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStylesManager.displaySmall(
                      context,
                      fontWeight: FontWeight.w600,
                      color: status == 'reading'
                          ? ColorsManager.readingTextColor
                          : status == 'complete'
                          ? ColorsManager.finishedTextColor
                          : ColorsManager.didNotReadYetTextColor,
                    ),
                  ),
                  Text(
                    pages.toString(),
                    style: TextStylesManager.displaySmall(
                      context,
                      fontWeight: FontWeight.w500,
                      size: SizeManager.smallFontSize12,
                      color: ColorsManager.whiteColor.withValues(alpha: .3),
                    ),
                  ),
                ],
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(right: 15.w),
                child: Icon(
                  fontWeight: FontWeight.w700,
                  size: 15.h,
                  status == 'reading'
                      ? CupertinoIcons.play
                      : status == 'complete'
                      ? CupertinoIcons.check_mark_circled
                      : Icons.lock_outline_rounded,
                  color: status == 'reading'
                      ? ColorsManager.readingTextColor
                      : status == 'complete'
                      ? ColorsManager.finishedTextColor
                      : ColorsManager.didNotReadYetTextColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
