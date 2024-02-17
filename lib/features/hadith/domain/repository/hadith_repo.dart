import 'package:dartz/dartz.dart';
import 'package:elresala/core/errors/failures.dart';
import 'package:elresala/features/hadith/data/models/hadith_model.dart';

abstract class HadithRepo {
  Future<Either<Failure, SunnahHadithModel>> getSunnahHadithes();
  Future<Either<Failure, HaditencHadithModel>> getHadithencHadithes();
}
