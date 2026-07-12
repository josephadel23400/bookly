part of 'user_book_details_cubit.dart';

sealed class UserBookDetailsState extends Equatable {
  const UserBookDetailsState();
  @override
  List<Object> get props => [];
}

final class UserBookDetailsInitial extends UserBookDetailsState {}

final class UserBookDetailsLoading extends UserBookDetailsState {}

final class UserBookDetailsSuccess extends UserBookDetailsState {}

final class UserBookDetailsFailer extends UserBookDetailsState {
  final String error;
  const UserBookDetailsFailer(this.error);
  @override
  List<Object> get props => [error];
}
