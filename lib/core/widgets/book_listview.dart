import 'package:bookly/core/resources/assets_manager.dart';
import 'package:bookly/core/resources/size_manager.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../resources/styles_manager.dart';

import '../../features/books_home/views/widgets/book_card_view.dart';

class BooksListView extends StatelessWidget {
 const BooksListView({super.key, this.scrollable = false, required this.listTitle});
  final bool scrollable;
  final String listTitle;
  @override
  Widget build(BuildContext context) {
    List<String> list = [
      ImageManager.bookI3mage,
      ImageManager.bookI2mage,
      ImageManager.bookImage,
      ImageManager.bookI2mage,
      ImageManager.bookI3mage,
      ImageManager.bookImage,
      ImageManager.bookI2mage,
      ImageManager.bookI3mage,
      ImageManager.bookImage,
      ImageManager.bookI2mage,
      ImageManager.bookI3mage,
    ];
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
                itemCount: 10,
                shrinkWrap: scrollable
                    ? false
                    : true, // ← sizes itself by content
                physics: scrollable
                    ? AlwaysScrollableScrollPhysics()
                    : const NeverScrollableScrollPhysics(), // does not scroll by itself only by parent
                itemBuilder: (context, index) {
                  return BookCardView(
                    image: list[index],
                    name: 'Harry Potter and the Goblet of Fire',
                    author: 'J.K. Rowling',
                    bookRating: 4.8,
                    price: 19.9,
                    views: 2058,
                  );
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
              itemCount: 10,
              shrinkWrap: scrollable
                  ? false
                  : true, // ← sizes itself by content
              physics: scrollable
                  ? AlwaysScrollableScrollPhysics()
                  : const NeverScrollableScrollPhysics(), // does not scroll by itself only by parent
              itemBuilder: (context, index) {
                return BookCardView(
                  image: list[index],
                  name: 'Harry Potter and the Goblet of Fire',
                  author: 'J.K. Rowling',
                  bookRating: 4.8,
                  price: 19.9,
                  views: 2058,
                );
              },
            ),
          ),
      ],
    );
  }
}
