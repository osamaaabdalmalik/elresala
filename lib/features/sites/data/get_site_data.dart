import 'dart:convert';
import 'package:elresala/core/services/firebase_storage_service.dart';
import 'package:get/get.dart';

class HomeData {
  FirebaseStorageService firebaseStorageService = Get.find();
  getData(String link, String nameSite) async {
    final String? redjson = await firebaseStorageService.readFile(name: link);
    Map<String, dynamic> response = await json.decode(redjson!);
    return response[nameSite];
  }
}
