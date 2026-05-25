part of 'my_books_cubit.dart';

sealed class MyBooksState extends Equatable {
  const MyBooksState();
}

final class MyBooksInitial extends MyBooksState {
  @override
  List<Object> get props => [];
}
