import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:elresala/core/constants/app_keys.dart';
import 'package:elresala/core/errors/failures.dart';
import 'package:elresala/core/helpers/get_failure_from_exception.dart';
import 'package:elresala/core/services/firebase_storage_service.dart';
import 'package:elresala/core/services/shared_preferences_service.dart';
import 'package:elresala/features/main/domain/entities/info_file_entity.dart';
import 'package:elresala/features/quran/data/data_sources/quran_remote_data_source.dart';
import 'package:elresala/features/quran/data/models/surah_model.dart';
import 'package:elresala/features/quran/domain/entities/surah_entity.dart';
import 'package:elresala/features/quran/domain/repository/quran_repo.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class QuranRepoImpl implements QuranRepo {
  final QuranRemoteDataSource quranRemoteDataSource;
  final SharedPreferencesService sharedPreferencesService;
  final FirebaseStorageService firebaseStorageService;

  const QuranRepoImpl({
    required this.quranRemoteDataSource,
    required this.sharedPreferencesService,
    required this.firebaseStorageService,
  });

  @override
  Future<Either<Failure, List<Surah>>> getSurahs({required Function(double progress) onProgress}) async {
    try {
      Get.find<Logger>().i("Start `getSurahs` in |QuranRepoImpl|");
      String currentLanguage = sharedPreferencesService.getData<String>(
            key: AppKeys.currentLanguage,
          ) ??
          '';
      String? quranJson = await firebaseStorageService.readFile(
        language: currentLanguage,
        name: AppKeys.quran,
      );
      if (quranJson == null) {
        InfoFile infoFile = await firebaseStorageService.getInfoFile(
          language: currentLanguage,
          name: AppKeys.quran,
        );
        await firebaseStorageService.downloadFile(
          infoFile: InfoFile(
            name: "$currentLanguage/${infoFile.name}",
            downloadUrl: infoFile.downloadUrl,
          ),
          onProgress: onProgress,
        );
        quranJson = await firebaseStorageService.readFile(
          language: currentLanguage,
          name: AppKeys.quran,
        );
      }
      List<Surah> surahs = [];
      if (quranJson != null) {
        var jsonData = jsonDecode(quranJson);
        surahs = jsonData
            .map<Surah>(
              (surah) => SurahModel.fromJson(surah),
            )
            .toList();
      }
      Get.find<Logger>().w("End `getSurahs` in |QuranRepoImpl| ${surahs.length}");
      return Right(surahs);
    } catch (e) {
      Get.find<Logger>().e("End `getSurahs` in |QuranRepoImpl| Exception: ${e.runtimeType}");
      return Left(getFailureFromException(e));
    }
  }
}
