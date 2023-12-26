import 'package:elresala/core/constants/app_keys.dart';
import 'package:elresala/core/services/firebase_storage_service.dart';
import 'package:elresala/core/services/shared_preferences_service.dart';
import 'package:elresala/features/hadith/data/models/hadith_model.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

abstract class MuslimLocalDataSource {
  Future<List<HadithModel>> getCourses();
}

class MuslimLocalDataSourceImpl extends MuslimLocalDataSource {
  final SharedPreferencesService sharedPreferencesService;
  final FirebaseStorageService firebaseStorageService;

  MuslimLocalDataSourceImpl({
    required this.sharedPreferencesService,
    required this.firebaseStorageService,
  });

  @override
  Future<List<HadithModel>> getCourses() async {
    try {
      Get.find<Logger>().i("Start `getCourses` in |MuslimLocalDataSourceImpl|");
      String? fileContent = await firebaseStorageService.readFile(name: AppKeys.muslims);

      /// TODO get data from file depend on content and convert to models
      /// example:
      /// `
      /// List<MuslimModel> hadithes = [];
      /// if (fileContent != null) {
      ///   var jsonData = json.decode(fileContent);
      ///   hadithes = jsonData
      ///       .map<MuslimModel>(
      ///         (surah) => MuslimModel.fromJson(surah),
      ///     )
      ///     .toList();
      ///  }
      ///  `
      Get.find<Logger>().w("End `getCourses` in |MuslimLocalDataSourceImpl|");
      return Future.value([] /** hadithes **/);
    } catch (e) {
      Get.find<Logger>().e(
        "End `getCourses` in |MuslimLocalDataSourceImpl| Exception: ${e.runtimeType}",
      );
      rethrow;
    }
  }
}
