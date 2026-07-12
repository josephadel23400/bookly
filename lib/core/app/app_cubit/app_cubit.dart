import 'package:bookly/core/data/book_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/user_book_model.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppState());
  void selectBook(BookModel book) {
    emit(
      state.copyWith(selectedBook: book, bookStack: [...state.bookStack, book]),
    );
  }

  void changeTab(int index) {
    emit(state.copyWith(currentTabIndex: index));
  }

  void selectUserBook(BookModel book, UserBookModel userBookStatus) {
    emit(state.copyWith(selectedBook: book, selectedUserBook: userBookStatus));
  }

  void goBack() {
    if (state.bookStack.length <= 1) {
      emit(state.copyWith(bookStack: []));
      return;
    }
    final newStack = [...state.bookStack]..removeLast(); // 👈 pop current
    emit(
      state.copyWith(
        bookStack: newStack,
        selectedBook: newStack.last, // 👈 restore previous
      ),
    );
  }
}
