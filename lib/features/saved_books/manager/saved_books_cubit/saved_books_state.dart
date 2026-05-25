part of 'saved_books_cubit.dart';

sealed class SavedBooksState extends Equatable {
  const SavedBooksState();
}

final class SavedBooksInitial extends SavedBooksState {
  @override
  List<Object> get props => [];
}
