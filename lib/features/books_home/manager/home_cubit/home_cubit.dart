import 'package:bookly/core/app/app_cubit/app_cubit.dart';
import 'package:bookly/core/data/book_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final AppCubit appCubit;
  HomeCubit({required this.appCubit}) : super(HomeInitial());
  void goToBookDetails(BookModel book) {
    appCubit.selectBook(book);

  }
}
