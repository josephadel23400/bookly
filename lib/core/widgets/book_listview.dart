import 'package:bookly/core/resources/assets_manager.dart';
import 'package:bookly/core/resources/size_manager.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../data/book_model.dart';
import '../resources/styles_manager.dart';

import 'book_card_view.dart';

class BooksListView extends StatelessWidget {
  const BooksListView({
    super.key,
    this.scrollable = false,
    required this.listTitle,
  });
  final bool scrollable;
  final String listTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20.w, bottom: 20.h, top: 25.h),
          child: Text(
            textAlign: TextAlign.right,
            listTitle,
            style: TextStylesManager.displayMedium(context),
          ),
        ),
        if (scrollable)
          Expanded(
            child: Container(
              //height: 361.h,
              width: SizeManager.screenSizeH90,
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: ListView.builder(
                //TODO:  PATH THE NEW LIST
                itemCount: books.length,

                shrinkWrap: scrollable
                    ? false
                    : true, // ← sizes itself by content
                physics: scrollable
                    ? AlwaysScrollableScrollPhysics()
                    : const NeverScrollableScrollPhysics(), // does not scroll by itself only by parent
                itemBuilder: (context, index) {
                  return BookCardView(book: books[index]);
                },
              ),
            ),
          )
        else
          Container(
            //height: 361.h,
            width: SizeManager.screenSizeH90,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: ListView.builder(
              //TODO: remove the reverse PATH THE NEW LIST
              reverse: true,
              itemCount: books.length,
              shrinkWrap: scrollable
                  ? false
                  : true, // ← sizes itself by content
              physics: scrollable
                  ? AlwaysScrollableScrollPhysics()
                  : const NeverScrollableScrollPhysics(), // does not scroll by itself only by parent
              itemBuilder: (context, index) {
                return BookCardView(book: books[index]);
              },
            ),
          ),
      ],
    );
  }
}
