part of 'profile_cubit.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();
  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {}

final class ProfileChangingGenre extends ProfileState {
  final Set<String> selectedGenres;
  const ProfileChangingGenre({required this.selectedGenres});

  @override
  List<Object> get props => [selectedGenres];
}
