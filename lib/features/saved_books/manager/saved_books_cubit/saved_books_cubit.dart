import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'saved_books_state.dart';

class SavedBooksCubit extends Cubit<SavedBooksState> {
  SavedBooksCubit() : super(SavedBooksInitial());
}
