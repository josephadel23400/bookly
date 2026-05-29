import 'package:bookly/features/my_books/views/widgets/my_books_app_bar.dart';
import 'package:flutter/material.dart';

import '../../books_home/views/widgets/my_books_body.dart';

class MyBooksPage extends StatelessWidget {
  const MyBooksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: Column(children: [MyBooksAppBar(), MyBooksBody(),])),
    );
  }
}
