import 'dart:convert';

import 'package:elresala/core/constants/app_keys.dart';
import 'package:elresala/core/services/archive_service.dart';
import 'package:elresala/core/services/shared_preferences_service.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../models/muslim_model_main.dart';
import '../models/muslim_model_sub.dart';

abstract class MuslimLocalDataSource {
  Future<List<MuslimModel>> getCoursesOfQuran();

  Future<List<MuslimCoursesModel>> getCoursesOfArkan();

  Future<List<MuslimCoursesModel>> getCoursesOfAyman();

  Future<List<MuslimCoursesModel>> getCoursesOfMoomalt();

  Future<List<MuslimCoursesModel>> getCoursesOfNewlife();

  Future<List<MuslimModel>> getCoursesOfNewMuslim();

  Future<List<MuslimCoursesModel>> getCoursesOfSerah();



}

class MuslimLocalDataSourceImpl extends MuslimLocalDataSource {
  final SharedPreferencesService sharedPreferencesService;
  final ArchiveService archiveService;

  MuslimLocalDataSourceImpl({
    required this.sharedPreferencesService,
    required this.archiveService,
  });

  @override
  Future<List<MuslimModel>> getCoursesOfQuran() async {
    try {
      Get.find<Logger>().i("Start `getCourses Quran` in |MuslimLocalDataSourceImpl|");
      String? muslimJson= await archiveService.readFile(name: AppKeys.newmuslim_quran);
       List<MuslimModel> courses = [];

      if (muslimJson != null) {
         var jsonData = json.decode(muslimJson);

         courses = jsonData["courses"]
             .map<MuslimModel>(
               (surah) => MuslimModel.fromJson(surah),
             )
             .toList();
       }
      Get.find<Logger>().w("End `getCourses Quran` in |MuslimLocalDataSourceImpl| ");
      return Future.value(courses);
    } catch (e,s) {
      Get.find<Logger>().e(
        "End `getCourses Quran` in |MuslimLocalDataSourceImpl| Exception: ${e.runtimeType} $s",
      );
      rethrow;
    }
  }

  @override
  Future<List<MuslimCoursesModel>> getCoursesOfArkan()async {
    try {
      Get.find<Logger>().i("Start `getCourses Arkan` in |MuslimLocalDataSourceImpl|");
      String? muslimJson= await archiveService.readFile(name: AppKeys.Arkan_of_islam);
      List<MuslimCoursesModel> courses = [];

      if (muslimJson != null) {
        var jsonData = json.decode(muslimJson);

        courses = jsonData["courses"]
            .map<MuslimCoursesModel>(
              (surah) => MuslimCoursesModel.fromJson(surah),
        )
            .toList();
      }
      Get.find<Logger>().w("End `getCourses Arkan` in |MuslimLocalDataSourceImpl| ");
      return Future.value(courses);
    } catch (e,s) {
      Get.find<Logger>().e(
        "End `getCourses Arkan` in |MuslimLocalDataSourceImpl| Exception: ${e.runtimeType} $s",
      );
      rethrow;
    }
  }

  @override
  Future<List<MuslimCoursesModel>> getCoursesOfAyman() async{
    try {
      Get.find<Logger>().i("Start `getCourses Ayman` in |MuslimLocalDataSourceImpl|");
      String? muslimJson= await archiveService.readFile(name: AppKeys.Ayman);
      List<MuslimCoursesModel> courses = [];

      if (muslimJson != null) {
        var jsonData = json.decode(muslimJson);

        courses = jsonData["courses"]
            .map<MuslimCoursesModel>(
              (surah) => MuslimCoursesModel.fromJson(surah),
        )
            .toList();
      }
      Get.find<Logger>().w("End `getCourses Ayman` in |MuslimLocalDataSourceImpl| ");
      return Future.value(courses);
    } catch (e,s) {
      Get.find<Logger>().e(
        "End `getCourses Ayman` in |MuslimLocalDataSourceImpl| Exception: ${e.runtimeType} $s",
      );
      rethrow;
    }
  }

  @override
  Future<List<MuslimCoursesModel>> getCoursesOfMoomalt() async{
    try {
      Get.find<Logger>().i("Start `getCourses Mooamlat` in |MuslimLocalDataSourceImpl|");
      String? muslimJson= await archiveService.readFile(name: AppKeys.moomlat);
      List<MuslimCoursesModel> courses = [];

      if (muslimJson != null) {
        var jsonData = json.decode(muslimJson);
        print(jsonData);
        courses = jsonData["courses"]
            .map<MuslimCoursesModel>(
              (surah) => MuslimCoursesModel.fromJson(surah),
        )
            .toList();
      }
      Get.find<Logger>().w("End `getCourses Mooamlat` in |MuslimLocalDataSourceImpl| ");
      return Future.value(courses);
    } catch (e,s) {
      Get.find<Logger>().e(
        "End `getCourses Mooamlat` in |MuslimLocalDataSourceImpl| Exception: ${e.runtimeType} $s",
      );
      rethrow;
    }
  }

  @override
  Future<List<MuslimModel>> getCoursesOfNewMuslim() async{
    try {
      Get.find<Logger>().i("Start `getCourses  New Muslim` in |MuslimLocalDataSourceImpl|");
      String? muslimJson= await archiveService.readFile(name: AppKeys.newmuslimscourse);
      List<MuslimModel> courses = [];

      if (muslimJson != null) {
        var jsonData = json.decode(muslimJson);
        print(jsonData);
        courses = jsonData["courses"]
            .map<MuslimCoursesModel>(
              (surah) => MuslimCoursesModel.fromJson(surah),
        )
            .toList();
      }
      Get.find<Logger>().w("End `getCourses New Muslim` in |MuslimLocalDataSourceImpl| ");
      return Future.value(courses);
    } catch (e,s) {
      Get.find<Logger>().e(
        "End `getCourses New Muslim` in |MuslimLocalDataSourceImpl| Exception: ${e.runtimeType} $s",
      );
      rethrow;
    }
  }

  @override
  Future<List<MuslimCoursesModel>> getCoursesOfNewlife() async{
    try {
      Get.find<Logger>().i("Start `getCourses Newlife` in |MuslimLocalDataSourceImpl|");
      String? muslimJson= await archiveService.readFile(name: AppKeys.newlife);
      List<MuslimCoursesModel> courses = [];

      if (muslimJson != null) {
        var jsonData = json.decode(muslimJson);
        print(jsonData);
        courses = jsonData["courses"]
            .map<MuslimCoursesModel>(
              (surah) => MuslimCoursesModel.fromJson(surah),
        )
            .toList();
      }
      Get.find<Logger>().w("End `getCourses Newlife` in |MuslimLocalDataSourceImpl| ");
      return Future.value(courses);
    } catch (e,s) {
      Get.find<Logger>().e(
        "End `getCourses Newlife` in |MuslimLocalDataSourceImpl| Exception: ${e.runtimeType} $s",
      );
      rethrow;
    }
  }

  @override
  Future<List<MuslimCoursesModel>> getCoursesOfSerah() async{
    try {
      Get.find<Logger>().i("Start `getCourses Serah` in |MuslimLocalDataSourceImpl|");
      String? muslimJson= await archiveService.readFile(name: AppKeys.serah_Almostafa);
      List<MuslimCoursesModel> courses = [];

      if (muslimJson != null) {
        var jsonData = json.decode(muslimJson);
        print(jsonData);
        courses = jsonData["courses"]
            .map<MuslimCoursesModel>(
              (surah) => MuslimCoursesModel.fromJson(surah),
        )
            .toList();
      }
      Get.find<Logger>().w("End `getCourses Serah` in |MuslimLocalDataSourceImpl| ");
      return Future.value(courses);
    } catch (e,s) {
      Get.find<Logger>().e(
        "End `getCourses Serah` in |MuslimLocalDataSourceImpl| Exception: ${e.runtimeType} $s",
      );
      rethrow;
    }
  }
}
