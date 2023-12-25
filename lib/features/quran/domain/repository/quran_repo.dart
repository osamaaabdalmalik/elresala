import 'package:dartz/dartz.dart';
import 'package:elresala/core/errors/failures.dart';
import 'package:elresala/features/quran/domain/entities/surah_entity.dart';

abstract class QuranRepo {
  Future<Either<Failure, List<Surah>>> getSurahs();
}
