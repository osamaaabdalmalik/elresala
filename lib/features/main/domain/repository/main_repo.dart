import 'package:dartz/dartz.dart';
import 'package:elresala/core/errors/failures.dart';
import 'package:elresala/features/main/domain/entities/language_entity.dart';

abstract class MainRepo {
  Future<Either<Failure, List<Language>>> getLanguages();
}
