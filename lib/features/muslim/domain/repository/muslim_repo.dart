import 'package:dartz/dartz.dart';
import 'package:elresala/core/errors/failures.dart';
import 'package:elresala/features/muslim/data/models/muslim_model.dart';

abstract class MuslimRepo {
  Future<Either<Failure, List<MuslimModel>>> getCourses();
}
