import 'package:dartz/dartz.dart';
import 'package:elresala/core/errors/failures.dart';
import 'package:elresala/core/helpers/get_failure_from_exception.dart';
import 'package:elresala/features/main/data/data_sources/main_local_data_source.dart';
import 'package:elresala/features/main/data/data_sources/main_remote_data_source.dart';
import 'package:elresala/features/main/domain/entities/language_entity.dart';
import 'package:elresala/features/main/domain/repository/main_repo.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class MainRepoImpl implements MainRepo {
  final MainRemoteDataSource mainRemoteDataSource;
  final MainLocalDataSource mainLocalDataSource;

  const MainRepoImpl({
    required this.mainRemoteDataSource,
    required this.mainLocalDataSource,
  });

  @override
  Future<Either<Failure, List<Language>>> getLanguages() async {
    try {
      Get.find<Logger>().i("Start `getLanguages` in |MainRepoImpl|");
      // List<String> languagesAsListStrings = await Get.find<FirebaseStorageService>().getLanguages();
      // List<Language> languages = await mainLocalDataSource.getLanguages(
      //   languagesAsListStrings: languagesAsListStrings,
      // );
      Get.find<Logger>().w("End `getLanguages` in |MainRepoImpl|");
      return const Right([]);
    } catch (e, s) {
      Get.find<Logger>().e("End `getLanguages` in |MainRepoImpl| Exception: $s");
      return Left(getFailureFromException(e));
    }
  }
}
