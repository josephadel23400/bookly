import 'package:bookly/core/resources/styles_manager.dart';
import 'package:bookly/core/widgets/book_card_view.dart';
import 'package:bookly/features/my_books/views/widgets/reading_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/data/book_model.dart';
import '../../../../core/resources/colors_manager.dart';
import 'custom_book_status_grid_card.dart';
import 'all_books_tab.dart';
import 'finished_tab.dart';
import 'for_later_tab.dart';

class MyBooksBody extends StatelessWidget {
  const MyBooksBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.w),
        child: DefaultTabController(
          length: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('My Books', style: TextStylesManager.displayMedium(context)),
              // SizedBox(height: 10.h),
              // Text(
              //   'Currently Reading',
              //   style: TextStylesManager.displayMedium(context),
              // ),
              //SizedBox(height: 15.h),

              //
              TabBar(
                labelStyle: TextStylesManager.displaySmall(context),
                isScrollable: true,
                padding: EdgeInsets.zero,
                dividerColor: ColorsManager.dividerColor,
                tabAlignment: TabAlignment.start,
                indicatorColor: ColorsManager.orangeColor,
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: ColorsManager.orangeColor,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(text: 'All'),
                  Tab(text: 'Reading'),
                  Tab(text: 'Finished'),
                  Tab(text: 'Saved For Later'),
                ],
              ),
              SizedBox(height: 10.h),
              // BookCardView(book: books[0]),
              Expanded(
                child: TabBarView(
                  children: [
                    AllBooksTab(),
                    ReadingTab(),
                    FinishedTab(),
                    ForLaterTab(),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }
}
