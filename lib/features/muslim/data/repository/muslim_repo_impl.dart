import 'package:dartz/dartz.dart';
import 'package:elresala/core/errors/failures.dart';
import 'package:elresala/core/helpers/get_failure_from_exception.dart';
import 'package:elresala/features/muslim/data/data_sources/muslim_local_data_source.dart';
import 'package:elresala/features/muslim/data/data_sources/muslim_remote_data_source.dart';
import 'package:elresala/features/muslim/data/models/muslim_model_main.dart';
import 'package:elresala/features/muslim/domain/entities/muslim_entity.dart';
import 'package:elresala/features/muslim/domain/repository/muslim_repo.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../models/muslim_model_sub.dart';

class MuslimRepoImpl implements MuslimRepo {
  final MuslimRemoteDataSource muslimRemoteDataSource;
  final MuslimLocalDataSource muslimLocalDataSource;

  const MuslimRepoImpl( {
    required this.muslimRemoteDataSource,
    required this.muslimLocalDataSource,
  });

  @override
  Future<Either<Failure, List<Muslim>>> getCoursesOfQuran() async {
    try {
      Get.find<Logger>().i("Start `getCourses Quran` in |MuslimRepoImpl|");
      var courses = await muslimLocalDataSource.getCoursesOfQuran();
      Get.find<Logger>()
          .w("End `getCourses Quran` in |MuslimRepoImpl| ${courses.length}");
      return Right(courses);
    } catch (e) {
      Get.find<Logger>().e(
          "End `getCourses Quran` in |MuslimRepoImpl| Exception: ${e.runtimeType}");
      return Left(getFailureFromException(e));
    }
  }

  @override
  Future<Either<Failure, List<Muslim>>> getCoursesOfArkan() async {
    try {
      Get.find<Logger>().i("Start `getCourses Arkan` in |MuslimRepoImpl|");
      var courses = await muslimLocalDataSource.getCoursesOfArkan();
      Get.find<Logger>()
          .w("End `getCourses Arkan` in |MuslimRepoImpl| ${courses.length}");
      return Right(courses);
    } catch (e) {
      Get.find<Logger>().e(
          "End `getCourses Arkan` in |MuslimRepoImpl| Exception: ${e.runtimeType}");
      return Left(getFailureFromException(e));
    }
  }

  @override
  Future<Either<Failure, List<Muslim>>> getCoursesOfAyman() async {
    try {
      Get.find<Logger>().i("Start `getCourses Ayman` in |MuslimRepoImpl|");
      var courses = await muslimLocalDataSource.getCoursesOfAyman();
      Get.find<Logger>()
          .w("End `getCourses Ayman` in |MuslimRepoImpl| ${courses.length}");
      return Right(courses);
    } catch (e) {
      Get.find<Logger>().e(
          "End `getCourses Ayman`  in |MuslimRepoImpl| Exception: ${e.runtimeType}");
      return Left(getFailureFromException(e));
    }
  }

  @override
  Future<Either<Failure, List<Muslim>>> getCoursesOfMoomlat() async {
    try {
      Get.find<Logger>().i("Start `getCourses Moomlat` in |MuslimRepoImpl|");
      var courses = await muslimLocalDataSource.getCoursesOfMoomalt();
      Get.find<Logger>()
          .w("End `getCourses Moomlat` in |MuslimRepoImpl| ${courses.length}");
      return Right(courses);
    } catch (e) {
      Get.find<Logger>().e(
          "End `getCourses Moomlat` in |MuslimRepoImpl| Exception: ${e.runtimeType}");
      return Left(getFailureFromException(e));
    }
  }

  @override
  Future<Either<Failure, List<Muslim>>> getCoursesOfNewlife() async {
    try {
      Get.find<Logger>().i("Start `getCourses Newlife` in |MuslimRepoImpl|");
      var courses = await muslimLocalDataSource.getCoursesOfNewlife();
      Get.find<Logger>()
          .w("End `getCourses Newlife` in |MuslimRepoImpl| ${courses.length}");
      return Right(courses);
    } catch (e) {
      Get.find<Logger>().e(
          "End `getCourses Newlife` in |MuslimRepoImpl| Exception: ${e.runtimeType}");
      return Left(getFailureFromException(e));
    }
  }

  @override
  Future<Either<Failure, List<Muslim>>> getCoursesOfNewMuslim() async {
    try {
      Get.find<Logger>().i("Start `getCourses NewMuslim` in |MuslimRepoImpl|");
      var courses = await muslimLocalDataSource.getCoursesOfQuran();
      Get.find<Logger>()
          .w("End `getCourses NewMuslim` in |MuslimRepoImpl| ${courses.length}");
      return Right(courses);
    } catch (e) {
      Get.find<Logger>().e(
          "End `getCourses NewMuslim` in |MuslimRepoImpl| Exception: ${e.runtimeType}");
      return Left(getFailureFromException(e));
    }
  }

  @override
  Future<Either<Failure, List<Muslim>>> getCoursesOfSerah() async {
    try {
      Get.find<Logger>().i("Start `getCourses Serah` in |MuslimRepoImpl|");
      var courses = await muslimLocalDataSource.getCoursesOfSerah();
      Get.find<Logger>()
          .w("End `getCourses Serah` in |MuslimRepoImpl| ${courses.length}");
      return Right(courses);
    } catch (e) {
      Get.find<Logger>().e(
          "End `getCourses Serah` in |MuslimRepoImpl| Exception: ${e.runtimeType}");
      return Left(getFailureFromException(e));
    }
  }


}
