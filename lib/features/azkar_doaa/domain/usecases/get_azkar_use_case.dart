import 'package:dartz/dartz.dart';
import 'package:elresala/core/errors/failures.dart';
import 'package:elresala/features/azkar_doaa/domain/repository/azkar_doaa_repo.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../entities/azkar_entity.dart';

class GetAzkarUseCase {
  final AzkarDoaaRepo azkarDoaaRepo;

  GetAzkarUseCase(this.azkarDoaaRepo);

  Future<Either<Failure, List<Azkar>>> call() async {
    Get.find<Logger>().i("Call GetAzkarsUseCase");
    return await azkarDoaaRepo.getAzkar();
  }
}
