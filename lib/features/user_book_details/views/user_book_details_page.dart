import 'package:bookly/core/app/app_cubit/app_cubit.dart';
import 'package:bookly/core/data/book_model.dart';
import 'package:bookly/core/data/user_book_model.dart';
import 'package:bookly/core/resources/colors_manager.dart';
import 'package:bookly/features/user_book_details/views/widgets/user_book_details_app_bar.dart';
import 'package:bookly/features/user_book_details/views/widgets/user_book_details_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBookDetailsPage extends StatelessWidget {
  const UserBookDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final BookModel? book = context.read<AppCubit>().state.selectedBook;
    final UserBookModel? bookStatus = context
        .read<AppCubit>()
        .state
        .selectedUserBook;
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsManager.primaryMoveBackgroundColor,
        body: Column(
          children: [
            UserBookDetailsAppBar(),
            Expanded(
              child: UserBookDetailsBody(book: book!, bookStatus: bookStatus!),
            ),
          ],
        ),
      ),
    );
  }
}
