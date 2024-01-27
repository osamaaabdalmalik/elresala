import 'package:dartz/dartz.dart';
import 'package:elresala/core/errors/failures.dart';
import 'package:elresala/features/non_muslim/data/models/course_model.dart';

abstract class NonMuslimRepo {
  Future<Either<Failure, List<NonMuslimModel>>> getCourses();
}
