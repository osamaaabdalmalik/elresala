import 'package:elresala/core/constants/app_keys.dart';
import 'package:elresala/core/services/archive_service.dart';
import 'package:elresala/core/services/shared_preferences_service.dart';
import 'package:elresala/features/hadith/data/models/hadith_model.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

abstract class HadithLocalDataSource {
  Future<List<HadithModel>> getHadithes();
}

class HadithLocalDataSourceImpl extends HadithLocalDataSource {
  final SharedPreferencesService sharedPreferencesService;
  final ArchiveService archiveService;

  HadithLocalDataSourceImpl({
    required this.sharedPreferencesService,
    required this.archiveService,
  });

  @override
  Future<List<HadithModel>> getHadithes() async {
    try {
      Get.find<Logger>().i("Start `getHadithes` in |HadithLocalDataSourceImpl|");
      String? fileContent = await archiveService.readFile(name: AppKeys.hadith);

      /// TODO get data from file depend on content and convert to models
      /// example:
      /// `
      /// List<HadithModel> hadithes = [];
      /// if (fileContent != null) {
      ///   var jsonData = json.decode(fileContent);
      ///   hadithes = jsonData
      ///       .map<HadithModel>(
      ///         (surah) => HadithModel.fromJson(surah),
      ///     )
      ///     .toList();
      ///  }
      ///  `
      Get.find<Logger>().w("End `getHadithes` in |HadithLocalDataSourceImpl|");
      return Future.value([] /** hadithes **/);
    } catch (e) {
      Get.find<Logger>().e(
        "End `getHadithes` in |HadithLocalDataSourceImpl| Exception: ${e.runtimeType}",
      );
      rethrow;
    }
  }
}
