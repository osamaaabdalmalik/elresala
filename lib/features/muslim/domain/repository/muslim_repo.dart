import 'package:dartz/dartz.dart';
import 'package:elresala/core/errors/failures.dart';
import 'package:elresala/features/hadith/domain/entities/hadith_entity.dart';

abstract class MuslimRepo {
  Future<Either<Failure, List<Hadith>>> getCourses();
}
