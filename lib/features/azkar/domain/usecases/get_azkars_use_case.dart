import 'package:dartz/dartz.dart';
import 'package:elresala/core/errors/failures.dart';
import 'package:elresala/features/azkar/domain/repository/azkar_repo.dart';
import 'package:elresala/features/hadith/domain/entities/hadith_entity.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class GetAzkarsUseCase {
  final AzkarRepo azkarRepo;

  GetAzkarsUseCase(this.azkarRepo);

  Future<Either<Failure, List<Hadith>>> call() async {
    Get.find<Logger>().i("Call GetAzkarsUseCase");
    return await azkarRepo.getAzkars();
  }
}
