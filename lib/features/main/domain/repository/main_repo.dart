import 'package:dartz/dartz.dart';
import 'package:elresala/core/errors/failures.dart';
import 'package:elresala/features/main/domain/entities/pair_entity.dart';

abstract class MainRepo {
  Future<Either<Failure, List<Pair>>> getCategoriesAsPair({required int repositoryId});
}
