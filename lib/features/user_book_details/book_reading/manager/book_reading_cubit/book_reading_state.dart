part of 'book_reading_cubit.dart';

sealed class BookReadingState extends Equatable {
  const BookReadingState();
}

final class BookReadingInitial extends BookReadingState {
  @override
  List<Object> get props => [];
}
