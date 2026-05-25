import 'dart:ui';

import 'package:bookly/core/resources/colors_manager.dart';
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
      floatingActionButton: IconButton(
        onPressed: () {
          context.go(Routes.booksPage);
        },
        icon: ClipOval(
          child: Container(
            height: 55.h,
            width: 55.h,
            color: ColorsManager.whiteColor.withValues(alpha: .3),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
              child: Icon(
                color: ColorsManager.whiteColor,
                Icons.home_rounded,
                size: 35.h,
              ),
            ),
          ),
        ),
      ),
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
    );
  }
}
