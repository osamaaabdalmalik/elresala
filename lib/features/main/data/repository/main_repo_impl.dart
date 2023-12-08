import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:elresala/core/errors/failures.dart';
import 'package:elresala/core/helpers/get_failure_from_exception.dart';
import 'package:elresala/features/main/data/data_sources/main_remote_data_source.dart';
import 'package:elresala/features/main/domain/entities/pair_entity.dart';
import 'package:elresala/features/main/domain/repository/main_repo.dart';

class MainRepoImpl implements MainRepo {
  final MainRemoteDataSource mainRemoteDataSource;

  const MainRepoImpl({required this.mainRemoteDataSource});

  @override
  Future<Either<Failure, List<Pair>>> getCategoriesAsPair({required int repositoryId}) async {
    try {
      Get.find<Logger>().i("Start `getCategoriesAsPair` in |MainRepoImpl|");
      var pairModels = await mainRemoteDataSource.getCategoriesAsPair(repositoryId: repositoryId);
      Get.find<Logger>().f("End `getCategoriesAsPair` in |MainRepoImpl|");
      return Right(pairModels);
    } catch (e) {
      Get.find<Logger>().e("End `getCategoriesAsPair` in |MainRepoImpl| Exception: ${e.runtimeType}");
      return Left(getFailureFromException(e));
    }
  }

}
