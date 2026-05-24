import 'package:bookly/core/resources/size_manager.dart';
import 'package:bookly/features/search_for_book/view/widgets/custom_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widgets/book_listview.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CustomSearchBar(),
            Expanded(

              child: BooksListView(scrollable: true,listTitle: 'Search Result',),
            ),
          ],
        ),
      ),
    );
  }
}
