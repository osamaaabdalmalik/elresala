import 'package:dartz/dartz.dart';
import 'package:elresala/core/errors/failures.dart';
import 'package:elresala/core/helpers/get_failure_from_exception.dart';
import 'package:elresala/features/doaa/data/data_sources/doaa_local_data_source.dart';
import 'package:elresala/features/doaa/data/data_sources/doaa_remote_data_source.dart';
import 'package:elresala/features/doaa/domain/repository/doaa_repo.dart';
import 'package:elresala/features/hadith/domain/entities/hadith_entity.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class DoaaRepoImpl implements DoaaRepo {
  final DoaaRemoteDataSource doaaRemoteDataSource;
  final DoaaLocalDataSource doaaLocalDataSource;

  const DoaaRepoImpl({
    required this.doaaRemoteDataSource,
    required this.doaaLocalDataSource,
  });

  @override
  Future<Either<Failure, List<Hadith>>> getDoaas() async {
    try {
      Get.find<Logger>().i("Start `getDoaas` in |DoaaRepoImpl|");
      var hadithes = await doaaLocalDataSource.getDoaas();
      Get.find<Logger>().w("End `getDoaas` in |DoaaRepoImpl| ${hadithes.length}");
      return Right(hadithes);
    } catch (e) {
      Get.find<Logger>().e("End `getDoaas` in |DoaaRepoImpl| Exception: ${e.runtimeType}");
      return Left(getFailureFromException(e));
    }
  }
}
