import 'dart:io';

import 'package:image_picker/image_picker.dart';

Future<File?> pickImage() async {
  File? file;
  ImagePicker imagePicker = ImagePicker();
  XFile? image = await imagePicker.pickImage(source: ImageSource.gallery);

  if (image != null) {
    file = File(image.path);
    return file;
  } else {
    return null;
  }
}
