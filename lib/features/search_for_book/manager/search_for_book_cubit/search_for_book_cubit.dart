import 'package:bloc/bloc.dart';
import 'package:bookly/core/data/book_model.dart';
import 'package:equatable/equatable.dart';

part 'search_for_book_state.dart';

class SearchForBookCubit extends Cubit<SearchForBookState> {
  SearchForBookCubit() : super(SearchForBookInitial());
}
