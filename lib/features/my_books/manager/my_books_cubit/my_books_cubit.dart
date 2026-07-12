import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:bookly/core/data/book_model.dart';
import 'package:bookly/core/data/user_book_model.dart';
import 'package:bookly/core/resources/colors_manager.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/app/app_cubit/app_cubit.dart';

part 'my_books_state.dart';

class MyBooksCubit extends Cubit<MyBooksState> {
  final AppCubit appCubit;

  MyBooksCubit({required this.appCubit}) : super(MyBooksInitial());
  List<BookModel> getMyBooks() {
    List<BookModel> list = [];
    late BookModel? book;
    for (int i = 0; i < userBooks.length; i++) {
      book = findBookById(userBooks[i].bookId);
      list.add(book!);
    }
    return list;
  }

  BookModel? findBookById(int id) {
    try {
      return books.firstWhere((book) => book.id == id);
    } catch (e) {
      return null; // not found
    }
  }

  String getReadingPercentage(double percentage) {
    if (percentage == 0) {
      return 'Read';
    } else if (1 > percentage && percentage > 0) {
      return '${percentage * 100}% read';
    } else {
      return 'Completed';
    }
  }

  String getReadingStatus(double percentage) {
    if (percentage == 0) {
      return 'Start';
    } else if (1 > percentage && percentage > 0) {
      return 'Reading';
    } else {
      return 'Finished';
    }
  }

  List<Color> getReadingPercentageColor(double percentage) {
    if (percentage == 0) {
      return [
        ColorsManager.whiteColor,
        ColorsManager.linearProgressBackGroundColor,
      ];
    } else if (1 > percentage && percentage > 0) {
      return [
        ColorsManager.readingTextColor,
        ColorsManager.readingBackGroundColor,
      ];
    } else {
      return [
        ColorsManager.finishedTextColor,
        ColorsManager.finishedBackGroundColor,
      ];
    }
  }

  // usage
  //final book = findBookById(654684234);
}
