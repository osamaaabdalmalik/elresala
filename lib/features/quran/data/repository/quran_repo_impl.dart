import 'package:dartz/dartz.dart';
import 'package:elresala/core/errors/failures.dart';
import 'package:elresala/core/helpers/get_failure_from_exception.dart';
import 'package:elresala/features/quran/data/data_sources/quran_local_data_source.dart';
import 'package:elresala/features/quran/data/data_sources/quran_remote_data_source.dart';
import 'package:elresala/features/quran/domain/entities/surah_entity.dart';
import 'package:elresala/features/quran/domain/repository/quran_repo.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class QuranRepoImpl implements QuranRepo {
  final QuranRemoteDataSource quranRemoteDataSource;
  final QuranLocalDataSource quranLocalDataSource;

  const QuranRepoImpl({
    required this.quranRemoteDataSource,
    required this.quranLocalDataSource,
  });

  @override
  Future<Either<Failure, List<Surah>>> getSurahs() async {
    try {
      Get.find<Logger>().i("Start `getSurahs` in |QuranRepoImpl|");
      var surahs = await quranLocalDataSource.getSurahs();
      Get.find<Logger>().w("End `getSurahs` in |QuranRepoImpl| ${surahs.length}");
      return Right(surahs);
    } catch (e) {
      Get.find<Logger>().e("End `getSurahs` in |QuranRepoImpl| Exception: ${e.runtimeType}");
      return Left(getFailureFromException(e));
    }
  }
}
