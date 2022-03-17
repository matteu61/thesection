import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:firebase_storage/firebase_storage.dart' as fb;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

class ImageRepo extends Equatable {
  const ImageRepo();
  //get single image
  Future<XFile?> getSingleImage() async {
    return await ImagePicker().pickImage(source: ImageSource.gallery);
  }

  //get multi images
  Future<List<XFile>> getMultipleImages() async {
    List<XFile>? _images = await ImagePicker().pickMultiImage();
    if (_images!.isNotEmpty) {
      return _images;
    }
    return [];
  }

  //get image name
  String getImageName(XFile image) {
    return image.path.split('/').last;
  }

  @override
  List<Object?> get props => [getMultipleImages()];
}

class Storage {
  final fb.FirebaseStorage _storage = fb.FirebaseStorage.instance;
  //fb.Reference ref = fb.FirebaseStorage.instance.ref().child('products/');

  Future<TaskSnapshot> uploadImage(XFile image) async {
    var bytes = await image.readAsBytes();
    var ref = _storage.ref();
    var snapshot = await ref
        .child('descriptionimages/' + getImageName(image))
        .putData(bytes);
    return snapshot;
  }

  uploadImages(XFile image) async {
    final _storage = fb.FirebaseStorage.instance;

    if (kIsWeb) {
      var bytes = await image.readAsBytes();
      // ignore: unnecessary_null_comparison
      if (image != null) {
        var ref = _storage.ref();
        var snapshot = await ref
            .child('descriptionimages/' + getImageName(image))
            .putData(bytes);
        var downloadUrl = await snapshot.ref.getDownloadURL();
        print(
            'Progress: ${(snapshot.bytesTransferred / snapshot.totalBytes) * 100} %');

        return downloadUrl;
      } else
        print('No Path Received');
    }
  }

  //get image name
  String getImageName(XFile image) {
    return image.path.split('/').last;
  }
}
