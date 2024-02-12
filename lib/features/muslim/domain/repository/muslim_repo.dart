import 'package:dartz/dartz.dart';
import 'package:elresala/core/errors/failures.dart';
import 'package:elresala/features/muslim/data/models/muslim_model_main.dart';

abstract class MuslimRepo {
  Future<Either<Failure, List<MuslimModel>>> getCoursesOfQuran();

  Future<Either<Failure, List<MuslimCoursesModel>>> getCoursesOfSerah();

  Future<Either<Failure, List<MuslimModel>>> getCoursesOfNewMuslim();

  Future<Either<Failure, List<MuslimCoursesModel>>> getCoursesOfNewlife();

  Future<Either<Failure, List<MuslimCoursesModel>>> getCoursesOfMoomlat();

  Future<Either<Failure, List<MuslimCoursesModel>>> getCoursesOfAyman();

  Future<Either<Failure, List<MuslimCoursesModel>>> getCoursesOfArkan();


}
