import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'book_reading_state.dart';

class BookReadingCubit extends Cubit<BookReadingState> {
  BookReadingCubit() : super(BookReadingInitial());
}
