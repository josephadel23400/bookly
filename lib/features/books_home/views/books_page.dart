import 'package:bookly/core/widgets/app_shell.dart';
import 'package:bookly/core/widgets/book_listview.dart';
import 'package:bookly/features/books_home/views/widgets/home_page_app_bar.dart';
import 'package:bookly/features/books_home/views/widgets/horizontal_books_ads.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BooksPage extends StatelessWidget {
  const BooksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          HomePageAppBar(),
          HorizontalBooksAds(),
          BooksListView(listTitle: 'Best Seller'),
          SizedBox(height: 80.h),
        ],
      ),
    );
  }
}
