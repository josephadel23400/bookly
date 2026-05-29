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

import '../../manager/book_details_cubit/book_details_cubit.dart';

class BookPreview extends StatelessWidget {
  const BookPreview({super.key});

  @override
  Widget build(BuildContext context) {
    final BookModel book = context.read<AppCubit>().state.selectedBook!;
    final cubit = context.read<BookDetailsCubit>();
    return BlocProvider.value(
      value: cubit,
      child: Builder(              // 👈 Builder gives a new context below the provider
        builder: (context) {
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  BookPreviewAppBar(),
                  Hero(
                    tag: 'preview',
                    child: Material(
                      color: Colors.transparent,
                      child: BookPreviewInfoPart(book: book),
                    ),
                  ),

                  Divider(),
                  BookPreviewTextPart(), // 👈 now finds cubit correctly
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}