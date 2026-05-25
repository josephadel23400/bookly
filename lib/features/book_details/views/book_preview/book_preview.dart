import 'package:bookly/core/app/app_cubit/app_cubit.dart';
import 'package:bookly/core/data/book_model.dart';
import 'package:bookly/core/resources/colors_manager.dart';
import 'package:bookly/core/resources/size_manager.dart';
import 'package:bookly/core/resources/styles_manager.dart';
import 'package:bookly/features/book_details/views/book_preview/widgets/book_preview_app_bar.dart';
import 'package:bookly/features/book_details/views/book_preview/widgets/book_preview_info_part.dart';
import 'package:bookly/features/book_details/views/book_preview/widgets/book_preview_text_part.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookPreview extends StatelessWidget {
  const BookPreview({super.key});

  @override
  Widget build(BuildContext context) {
    final BookModel book = context.read<AppCubit>().state.selectedBook!;
    return Scaffold(
      // Scaffold OUTSIDE
      body: SafeArea(
        child: Hero(
          tag: 'preview',
          child: Material(
            color: Colors.transparent,
            child: Column(
              children: [
                BookPreviewAppBar(),
                BookPreviewInfoPart(book: book),
                Divider(),
                BookPreviewTextPart(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
