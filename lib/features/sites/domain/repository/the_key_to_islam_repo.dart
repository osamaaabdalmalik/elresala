import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../data/models/the_key_to_islam_model.dart';
import '../entities/learning_islam_entities.dart';

abstract class TheKeyToIslamRepo {
  Future<Either<Failure, List<TheKeyToIslamfirst>>> getArtical();
}
