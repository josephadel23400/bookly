part of 'book_details_cubit.dart';

sealed class BookDetailsState extends Equatable {
  const BookDetailsState();
  @override
  List<Object> get props => [];
}

final class BookDetailsInitial extends BookDetailsState {

}
class BookDetailsReady extends BookDetailsState {}   // 👈 add this

