import 'package:elresala/core/constants/app_keys.dart';
import 'package:elresala/core/services/firebase_storage_service.dart';
import 'package:elresala/core/services/shared_preferences_service.dart';
import 'package:elresala/features/hadith/data/models/hadith_model.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

abstract class DoaaLocalDataSource {
  Future<List<HadithModel>> getDoaas();
}

class DoaaLocalDataSourceImpl extends DoaaLocalDataSource {
  final SharedPreferencesService sharedPreferencesService;
  final FirebaseStorageService firebaseStorageService;

  DoaaLocalDataSourceImpl({
    required this.sharedPreferencesService,
    required this.firebaseStorageService,
  });

  @override
  Future<List<HadithModel>> getDoaas() async {
    try {
      Get.find<Logger>().i("Start `getDoaas` in |DoaaLocalDataSourceImpl|");
      String? fileContent = await firebaseStorageService.readFile(name: AppKeys.azkarDua);

      /// TODO get data from file depend on content and convert to models
      /// example:
      /// `
      /// List<DoaaModel> hadithes = [];
      /// if (fileContent != null) {
      ///   var jsonData = json.decode(fileContent);
      ///   hadithes = jsonData
      ///       .map<DoaaModel>(
      ///         (surah) => DoaaModel.fromJson(surah),
      ///     )
      ///     .toList();
      ///  }
      ///  `
      Get.find<Logger>().w("End `getDoaas` in |DoaaLocalDataSourceImpl|");
      return Future.value([] /** hadithes **/);
    } catch (e) {
      Get.find<Logger>().e(
        "End `getDoaas` in |DoaaLocalDataSourceImpl| Exception: ${e.runtimeType}",
      );
      rethrow;
    }
  }
}
