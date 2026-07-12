import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  File? pickedImage;
  final _picker = ImagePicker();
  EditProfileCubit() : super(EditProfileInitial());
  Future<void> pickImageFromCamera() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 80,
      );
      if (image != null) {
        pickedImage = File(image.path);
        emit(EditProfileImagePicked(pickedImage!));
      }
    } catch (e) {
      debugPrint('pickImageFromCamera error: $e');
      emit(EditProfileImagePickFailure(e.toString()));
      // TODO: surface a snackbar / toast if camera access fails or is denied
    }
  }

  Future<void> pickImageFromGallery() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );
      if (image != null) {
        pickedImage = File(image.path);
        emit(EditProfileImagePicked(pickedImage!));
      }
    } catch (e) {
      debugPrint('pickImageFromCamera error: $e');
      emit(EditProfileImagePickFailure(e.toString()));
      // TODO: surface a snackbar / toast if gallery access fails or is denied
    }
  }
}
