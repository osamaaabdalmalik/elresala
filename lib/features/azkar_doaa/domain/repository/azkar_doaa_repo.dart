import 'package:dartz/dartz.dart';
import 'package:elresala/core/errors/failures.dart';
import 'package:elresala/features/azkar_doaa/domain/entities/doaa_entity.dart';

import '../entities/azkar_entity.dart';

abstract class AzkarDoaaRepo {
  Future<Either<Failure, List<Azkar>>> getAzkar();
  Future<Either<Failure, Doaa>> getDoaas();
}
