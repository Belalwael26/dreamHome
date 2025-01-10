import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dream_home/core/errors/errors.dart';

abstract class ImagePickerRepo {
  Future<Either<Failure, String>> image({required File image});
}
