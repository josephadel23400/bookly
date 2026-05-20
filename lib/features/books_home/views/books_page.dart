import 'package:bookly/features/books_home/views/widgets/book_listview.dart';
import 'package:bookly/features/books_home/views/widgets/custom_app_bar.dart';
import 'package:bookly/features/books_home/views/widgets/float_navigation_bar.dart';
import 'package:bookly/features/books_home/views/widgets/horizontal_books_ads.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BooksPage extends StatelessWidget {
  const BooksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomAppBar(),
                  HorizontalBooksAds(),
                  BooksListView(),
                  SizedBox(height: 70.h,)
                ],
              ),
            ),
          ),
          FloatNavigationBar(),
        ],
      ),
    );
  }
}
