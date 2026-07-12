import 'package:bookly/core/data/user_book_model.dart';
import 'package:bookly/features/my_books/manager/my_books_cubit/my_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_book_status_grid_card.dart';

class AllBooksTab extends StatelessWidget {
  const AllBooksTab({super.key});

  @override
  Widget build(BuildContext context) {
    final myBooks = context.read<MyBooksCubit>().getMyBooks();
    return GridView.builder(
      padding: EdgeInsets.only(bottom: 90.h),
      //scrollDirection: Axis.horizontal,
      itemCount: userBooks.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 300.h,
        mainAxisSpacing: 10.h,
        crossAxisSpacing: 15.w,
        //childAspectRatio: .60,
      ),
      itemBuilder: (context, index) {
        return CustomBookStatusGridCard(
          book: myBooks[index],
          bookStatus: userBooks[index],
        );
      },
    );
  }
}
