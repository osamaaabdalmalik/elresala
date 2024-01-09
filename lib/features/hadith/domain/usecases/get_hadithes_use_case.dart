import 'package:dartz/dartz.dart';
import 'package:elresala/core/errors/failures.dart';
import 'package:elresala/features/hadith/domain/entities/hadith_entity.dart';
import 'package:elresala/features/hadith/domain/repository/hadith_repo.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class GetHadithesUseCase {
  final HadithRepo hadithRepo;

  GetHadithesUseCase(this.hadithRepo);

  Future<Either<Failure, List<Hadith>>> call() async {
    Get.find<Logger>().i("Call GetHadithesUseCase");
    return await hadithRepo.getHadithes();
  }
}
