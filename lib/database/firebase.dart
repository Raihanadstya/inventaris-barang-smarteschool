// ignore_for_file: avoid_print

import 'dart:io';
import 'package:slugify/slugify.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

firebase_storage.FirebaseStorage storage =
    firebase_storage.FirebaseStorage.instance;

Future uploadFile(String filePath) async {
  File file = File(filePath);
  String ref = slugify(DateTime.now().millisecondsSinceEpoch.toString() +
      file.uri.pathSegments.last);
  await firebase_storage.FirebaseStorage.instance
      .ref(ref)
      .putFile(file)
      .catchError(onError);
  print(ref);

  String downloadURL =
      await firebase_storage.FirebaseStorage.instance.ref(ref).getDownloadURL();

  return downloadURL;
}

onError(e) {
  print(e);
}
