import 'package:dartz/dartz.dart';
import 'package:elresala/features/sites/domain/entities/fixed_entities.dart';
import '../../../../core/errors/failures.dart';
import '../entities/islam_land_entities.dart';

abstract class IslamLandRepository {
  Future<Either<Failure, List<List<FixedEntities>>>> getContent();
  Future<Either<Failure, List<IslamLandFatwaEntities>>> getFatwa();
}
