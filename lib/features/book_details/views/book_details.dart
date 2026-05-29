import 'dart:ui';

import 'package:bookly/core/resources/colors_manager.dart';
import 'package:bookly/core/widgets/go_to_home_page_icon.dart';
import 'package:bookly/features/book_details/views/widgets/book_details_app_bar.dart';
import 'package:bookly/features/book_details/views/widgets/book_details_body.dart';
import 'package:bookly/features/book_details/views/widgets/you_can_also_like.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/resources/routs_manager.dart';

class BookDetails extends StatelessWidget {
  const BookDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BookDetailsAppBar(),
              BookDetailsBody(),
              YouCanAlsoLike(),
            ],
          ),
        ),
      ),
      floatingActionButton: GoToHomePageIcon(),
    );
  }
}
