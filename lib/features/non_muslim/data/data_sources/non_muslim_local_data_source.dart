import 'package:elresala/core/constants/app_keys.dart';
import 'package:elresala/core/services/firebase_storage_service.dart';
import 'package:elresala/core/services/shared_preferences_service.dart';
import 'package:elresala/features/hadith/data/models/hadith_model.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

abstract class NonMuslimLocalDataSource {
  Future<List<HadithModel>> getCourses();
}

class NonMuslimLocalDataSourceImpl extends NonMuslimLocalDataSource {
  final SharedPreferencesService sharedPreferencesService;
  final FirebaseStorageService firebaseStorageService;

  NonMuslimLocalDataSourceImpl({
    required this.sharedPreferencesService,
    required this.firebaseStorageService,
  });

  @override
  Future<List<HadithModel>> getCourses() async {
    try {
      Get.find<Logger>().i("Start `getCourses` in |NonMuslimLocalDataSourceImpl|");
      String? fileContent = await firebaseStorageService.readFile(name: AppKeys.muslims);

      /// TODO get data from file depend on content and convert to models
      /// example:
      /// `
      /// List<NonMuslimModel> hadithes = [];
      /// if (fileContent != null) {
      ///   var jsonData = json.decode(fileContent);
      ///   hadithes = jsonData
      ///       .map<NonMuslimModel>(
      ///         (surah) => NonMuslimModel.fromJson(surah),
      ///     )
      ///     .toList();
      ///  }
      ///  `
      Get.find<Logger>().w("End `getCourses` in |NonMuslimLocalDataSourceImpl|");
      return Future.value([] /** hadithes **/);
    } catch (e) {
      Get.find<Logger>().e(
        "End `getCourses` in |NonMuslimLocalDataSourceImpl| Exception: ${e.runtimeType}",
      );
      rethrow;
    }
  }
}
