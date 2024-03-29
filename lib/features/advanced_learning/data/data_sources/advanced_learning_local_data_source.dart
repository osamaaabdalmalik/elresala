import 'dart:convert';

import 'package:elresala/core/constants/app_keys.dart';
import 'package:elresala/core/services/archive_service.dart';
import 'package:elresala/core/services/shared_preferences_service.dart';
import 'package:elresala/features/quran/data/models/surah_model.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

abstract class AdvancedLearningLocalDataSource {
  Future<List<SurahModel>> getSurahs();
}

class AdvancedLearningLocalDataSourceImpl extends AdvancedLearningLocalDataSource {
  final SharedPreferencesService sharedPreferencesService;
  final ArchiveService archiveService;

  AdvancedLearningLocalDataSourceImpl({
    required this.sharedPreferencesService,
    required this.archiveService,
  });

  @override
  Future<List<SurahModel>> getSurahs() async {
    try {
      Get.find<Logger>().i("Start `getSurahs` in |AdvancedLearningLocalDataSourceImpl|");
      String? quranJson = await archiveService.readFile(name: AppKeys.quran);
      List<SurahModel> surahs = [];
      if (quranJson != null) {
        var jsonData = json.decode(quranJson);
        surahs = jsonData
            .map<SurahModel>(
              (surah) => SurahModel.fromJson(surah),
            )
            .toList();
      }
      Get.find<Logger>().w("End `getSurahs` in |AdvancedLearningLocalDataSourceImpl|");
      return Future.value(surahs);
    } catch (e) {
      Get.find<Logger>().e(
        "End `getSurahs` in |AdvancedLearningLocalDataSourceImpl| Exception: ${e.runtimeType}",
      );
      rethrow;
    }
  }
}
