import 'package:image_picker/image_picker.dart';

class ImageProfile {
  String? imagePath;
  ImagePicker picker = ImagePicker();

  Future pickImage(ImageSource source) async {
    XFile? image = await picker.pickImage(source: source);
    imagePath = image?.path;
  }
}
