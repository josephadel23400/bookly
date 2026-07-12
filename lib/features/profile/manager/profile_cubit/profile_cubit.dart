import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final List<String> genres = [
    'Fantasy',
    'Sci-Fi',
    'Adventure',
    'Mystery',
    'Classic',
  ];
  final Set<String> selectedGenres = {};
  ProfileCubit() : super(ProfileInitial());
  void changeGenres(String genre) {
    if (selectedGenres.contains(genre)) {
      selectedGenres.remove(genre);
    } else {
      selectedGenres.add(genre);
    }
    emit(ProfileChangingGenre(selectedGenres: Set.from(selectedGenres)));
  }
  void submitGenreChange(){
    emit(ProfileInitial());
  }
}
