import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'image_picker_state.dart';

class ImagePickerCubit extends Cubit<ImagePickerState> {
  ImagePickerCubit() : super(ImagePickerInitialState());

  ImagePicker imagePick = ImagePicker();
  ValueNotifier<File?> image = ValueNotifier<File?>(null);
  Future<void> imagePicker(ImageSource source) async {
    try {
      final pick = await imagePick.pickImage(source: source);
      if (pick != null) {
        image.value = File(pick.path);
        emit(ImagePickerSuccessState(image.value!));
      }
    } catch (e) {
      // print("====================================================$e");
    }
  }
}
