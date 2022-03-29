import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class CloudStorageService {
  CloudStorageService() {}

  Future<String> uploadImage(String filePath, String imageName) async {
    try {
      File imageFile = File(filePath);

      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref =
          storage.ref('uploads/').child(imageName);
      UploadTask uploadTask = ref.putFile(imageFile);

      Future<String> url = uploadTask.then((res) {
        return res.ref.getDownloadURL();
      });
      return url;
    } catch (e) {
      return "";
    }
  }
}
