import 'package:elresala/core/constants/app_keys.dart';
import 'package:elresala/core/services/firebase_storage_service.dart';
import 'package:elresala/core/services/shared_preferences_service.dart';
import 'package:elresala/features/hadith/data/models/hadith_model.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

abstract class AzkarLocalDataSource {
  Future<List<HadithModel>> getAzkars();
}

class AzkarLocalDataSourceImpl extends AzkarLocalDataSource {
  final SharedPreferencesService sharedPreferencesService;
  final FirebaseStorageService firebaseStorageService;

  AzkarLocalDataSourceImpl({
    required this.sharedPreferencesService,
    required this.firebaseStorageService,
  });

  @override
  Future<List<HadithModel>> getAzkars() async {
    try {
      Get.find<Logger>().i("Start `getAzkars` in |AzkarLocalDataSourceImpl|");
      String? fileContent = await firebaseStorageService.readFile(name: AppKeys.azkarDua);

      /// TODO get data from file depend on content and convert to models
      /// example:
      /// `
      /// List<AzkarModel> hadithes = [];
      /// if (fileContent != null) {
      ///   var jsonData = json.decode(fileContent);
      ///   hadithes = jsonData
      ///       .map<AzkarModel>(
      ///         (surah) => AzkarModel.fromJson(surah),
      ///     )
      ///     .toList();
      ///  }
      ///  `
      Get.find<Logger>().w("End `getAzkars` in |AzkarLocalDataSourceImpl|");
      return Future.value([] /** hadithes **/);
    } catch (e) {
      Get.find<Logger>().e(
        "End `getAzkars` in |AzkarLocalDataSourceImpl| Exception: ${e.runtimeType}",
      );
      rethrow;
    }
  }
}
