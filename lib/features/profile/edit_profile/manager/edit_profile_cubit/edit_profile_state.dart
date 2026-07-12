part of 'edit_profile_cubit.dart';

sealed class EditProfileState extends Equatable {
  const EditProfileState();
  @override
  List<Object> get props => [];
}

final class EditProfileInitial extends EditProfileState {}

final class EditProfileImagePicked extends EditProfileState {
  final File? pickedImage;
  const EditProfileImagePicked(this.pickedImage);
  @override
  List<Object> get props => [pickedImage!];
}

final class EditProfileImagePickFailure extends EditProfileState {
  final String message;
  const EditProfileImagePickFailure(this.message);

  @override
  List<Object> get props => [message];
}
