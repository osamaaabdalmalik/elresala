import 'package:dartz/dartz.dart';
import 'package:elresala/core/errors/failures.dart';
import 'package:elresala/features/hadith/domain/entities/hadith_entity.dart';
import 'package:elresala/features/muslim/domain/repository/muslim_repo.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class GetCoursesUseCase {
  final MuslimRepo azkarRepo;

  GetCoursesUseCase(this.azkarRepo);

  Future<Either<Failure, List<Hadith>>> call() async {
    Get.find<Logger>().i("Call GetMuslimsUseCase");
    return await azkarRepo.getCourses();
  }
}
