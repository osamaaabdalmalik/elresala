import 'package:dartz/dartz.dart';
import 'package:elresala/core/errors/failures.dart';
import 'package:elresala/features/hadith/data/models/hadith_model.dart';
import 'package:elresala/features/hadith/domain/repository/hadith_repo.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class GetSunnahHadithesUseCase {
  final HadithRepo hadithRepo;

  GetSunnahHadithesUseCase(this.hadithRepo);

  Future<Either<Failure, SunnahHadithModel>> call() async {
    Get.find<Logger>().i("Call GetHadithesUseCase");
    return await hadithRepo.getSunnahHadithes();
  }
}
