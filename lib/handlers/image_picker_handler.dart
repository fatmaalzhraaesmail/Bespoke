import 'dart:io';
import 'package:image_picker/image_picker.dart';

abstract class ImagePickerHelper {
  static Future<File?> pickImage({String title = "Pick a file", ImageSource? type}) async {
    File result = File((await ImagePicker().pickImage(source: type ?? ImageSource.gallery))!.path);
    return result;
  }
}
