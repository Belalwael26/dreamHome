import 'dart:io';

abstract class ImagePickerState {}

class ImagePickerInitialState extends ImagePickerState {}

class ImagePickerSuccessState extends ImagePickerState {
  final File image;

  ImagePickerSuccessState(
    this.image,
  );
}
