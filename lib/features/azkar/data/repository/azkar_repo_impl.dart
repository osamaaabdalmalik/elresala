import 'package:dartz/dartz.dart';
import 'package:elresala/core/errors/failures.dart';
import 'package:elresala/core/helpers/get_failure_from_exception.dart';
import 'package:elresala/features/azkar/data/data_sources/azkar_local_data_source.dart';
import 'package:elresala/features/azkar/data/data_sources/azkar_remote_data_source.dart';
import 'package:elresala/features/azkar/domain/repository/azkar_repo.dart';
import 'package:elresala/features/hadith/domain/entities/hadith_entity.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class AzkarRepoImpl implements AzkarRepo {
  final AzkarRemoteDataSource azkarRemoteDataSource;
  final AzkarLocalDataSource azkarLocalDataSource;

  const AzkarRepoImpl({
    required this.azkarRemoteDataSource,
    required this.azkarLocalDataSource,
  });

  @override
  Future<Either<Failure, List<Hadith>>> getAzkars() async {
    try {
      Get.find<Logger>().i("Start `getAzkars` in |AzkarRepoImpl|");
      var hadithes = await azkarLocalDataSource.getAzkars();
      Get.find<Logger>()
          .w("End `getAzkars` in |AzkarRepoImpl| ${hadithes.length}");
      return Right(hadithes);
    } catch (e) {
      Get.find<Logger>()
          .e("End `getAzkars` in |AzkarRepoImpl| Exception: ${e.runtimeType}");
      return Left(getFailureFromException(e));
    }
  }
}
