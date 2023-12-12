import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:elresala/core/constants/app_keys.dart';
import 'package:elresala/core/errors/failures.dart';
import 'package:elresala/core/helpers/get_failure_from_exception.dart';
import 'package:elresala/core/services/files_service.dart';
import 'package:elresala/core/services/shared_preferences_service.dart';
import 'package:elresala/features/quran/data/data_sources/quran_remote_data_source.dart';
import 'package:elresala/features/quran/data/models/surah_model.dart';
import 'package:elresala/features/quran/domain/entities/surah_entity.dart';
import 'package:elresala/features/quran/domain/repository/quran_repo.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class QuranRepoImpl implements QuranRepo {
  final QuranRemoteDataSource quranRemoteDataSource;
  final SharedPreferencesService sharedPreferencesService;
  final FileService fileService;

  const QuranRepoImpl({
    required this.quranRemoteDataSource,
    required this.sharedPreferencesService,
    required this.fileService,
  });

  @override
  Future<Either<Failure, List<Surah>>> getSurahs() async {
    try {
      Get.find<Logger>().i("Start `getSurahs` in |QuranRepoImpl|");
      String? currentLanguage = sharedPreferencesService.getPrimitiveData<String>(
        key: AppKeys.currentLanguage,
      );
      String? quranJson = await fileService.readFile(
        language: currentLanguage ?? "spanish",
        name: AppKeys.quran,
      );
      List<Surah> surahs = [];
      if (quranJson != null) {
        var jsonData = jsonDecode(quranJson);
        surahs = jsonData
            .map<Surah>(
              (surah) => SurahModel.fromJson(surah),
            )
            .toList();
      }
      Get.find<Logger>().f("End `getSurahs` in |QuranRepoImpl|");
      return Right(surahs);
    } catch (e) {
      Get.find<Logger>().e("End `getSurahs` in |QuranRepoImpl| Exception: ${e.runtimeType}");
      return Left(getFailureFromException(e));
    }
  }
}
