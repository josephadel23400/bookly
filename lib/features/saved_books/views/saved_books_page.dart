import 'package:bookly/features/saved_books/views/widgets/saved_books_app_bar.dart';
import 'package:bookly/features/saved_books/views/widgets/saved_books_body.dart';
import 'package:flutter/material.dart';

class SavedBooksPage extends StatelessWidget {
  const SavedBooksPage({super.key});

  @override
  Widget build(BuildContext context) {
    //final BookModel book = books[2];
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SavedBooksAppBar(),
            SavedBooksBody(),
          ],
        ),
      ),
    );
  }
}
