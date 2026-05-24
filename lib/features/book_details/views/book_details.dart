import 'package:bookly/features/book_details/views/widgets/book_details_app_bar.dart';
import 'package:bookly/features/book_details/views/widgets/book_details_body.dart';
import 'package:bookly/features/book_details/views/widgets/you_can_also_like.dart';
import 'package:flutter/material.dart';

class BookDetails extends StatelessWidget {
  const BookDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BookDetailsAppBar(), BookDetailsBody(),
            YouCanAlsoLike(),
          ],
        ),
      ),
    );
  }
}
