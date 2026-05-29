import 'package:bookly/core/resources/styles_manager.dart';
import 'package:flutter/material.dart';

class MyBooksBody extends StatelessWidget {
  const MyBooksBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('My Books', style: TextStylesManager.displayMedium(context)),

      ],
    );
  }
}
