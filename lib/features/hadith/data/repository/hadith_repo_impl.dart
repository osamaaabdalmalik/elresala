import 'package:dartz/dartz.dart';
import 'package:elresala/core/errors/failures.dart';
import 'package:elresala/core/helpers/get_failure_from_exception.dart';
import 'package:elresala/features/hadith/data/data_sources/hadith_local_data_source.dart';
import 'package:elresala/features/hadith/data/data_sources/hadith_remote_data_source.dart';
import 'package:elresala/features/hadith/domain/entities/hadith_entity.dart';
import 'package:elresala/features/hadith/domain/repository/hadith_repo.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class HadithRepoImpl implements HadithRepo {
  final HadithRemoteDataSource hadithRemoteDataSource;
  final HadithLocalDataSource hadithLocalDataSource;

  const HadithRepoImpl({
    required this.hadithRemoteDataSource,
    required this.hadithLocalDataSource,
  });

  @override
  Future<Either<Failure, List<Hadith>>> getHadithes() async {
    try {
      Get.find<Logger>().i("Start `getHadithes` in |HadithRepoImpl|");
      var hadithes = await hadithLocalDataSource.getHadithes();
      Get.find<Logger>().w("End `getHadithes` in |HadithRepoImpl| ${hadithes.length}");
      return Right(hadithes);
    } catch (e) {
      Get.find<Logger>().e("End `getHadithes` in |HadithRepoImpl| Exception: ${e.runtimeType}");
      return Left(getFailureFromException(e));
    }
  }
}
