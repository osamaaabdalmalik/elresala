import 'package:dartz/dartz.dart';
import 'package:elresala/core/errors/failures.dart';
import 'package:elresala/core/helpers/get_failure_from_exception.dart';
import 'package:elresala/features/muslim/data/data_sources/muslim_local_data_source.dart';
import 'package:elresala/features/muslim/data/data_sources/muslim_remote_data_source.dart';
import 'package:elresala/features/muslim/data/models/course_model.dart';
import 'package:elresala/features/muslim/domain/repository/muslim_repo.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class MuslimRepoImpl implements MuslimRepo {
  final MuslimRemoteDataSource muslimRemoteDataSource;
  final MuslimLocalDataSource muslimLocalDataSource;

  const MuslimRepoImpl({
    required this.muslimRemoteDataSource,
    required this.muslimLocalDataSource,
  });

  @override
  Future<Either<Failure, List<MuslimModel>>> getCourses() async {
    try {
      Get.find<Logger>().i("Start `getCourses` in |MuslimRepoImpl|");
      var courses = await muslimLocalDataSource.getCourses();
      Get.find<Logger>()
          .w("End `getCourses` in |MuslimRepoImpl| ${courses.length}");
      return Right(courses);
    } catch (e) {
      Get.find<Logger>().e(
          "End `getCourses` in |MuslimRepoImpl| Exception: ${e.runtimeType}");
      return Left(getFailureFromException(e));
    }
  }
}
