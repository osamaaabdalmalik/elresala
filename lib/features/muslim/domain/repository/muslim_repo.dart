import 'package:dartz/dartz.dart';
import 'package:elresala/core/errors/failures.dart';
import 'package:elresala/features/muslim/data/models/muslim_model_main.dart';
import 'package:elresala/features/muslim/domain/entities/muslim_entity.dart';

abstract class MuslimRepo {
  Future<Either<Failure, List<Muslim>>> getCoursesOfQuran();

  Future<Either<Failure, List<Muslim>>> getCoursesOfSerah();

  Future<Either<Failure, List<Muslim>>> getCoursesOfNewMuslim();

  Future<Either<Failure, List<Muslim>>> getCoursesOfNewlife();

  Future<Either<Failure, List<Muslim>>> getCoursesOfMoomlat();

  Future<Either<Failure, List<Muslim>>> getCoursesOfAyman();

  Future<Either<Failure, List<Muslim>>> getCoursesOfArkan();


}
