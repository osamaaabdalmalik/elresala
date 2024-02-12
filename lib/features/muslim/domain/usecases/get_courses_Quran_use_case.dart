import 'package:dartz/dartz.dart';
import 'package:elresala/core/errors/failures.dart';
import 'package:elresala/features/muslim/data/models/muslim_model_main.dart';
import 'package:elresala/features/muslim/domain/repository/muslim_repo.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class GetCoursesQuranUseCase {
  final MuslimRepo muslimRepo;

  GetCoursesQuranUseCase(this.muslimRepo);

  Future<Either<Failure, List<MuslimModel>>> call() async {
    Get.find<Logger>().i("Call GetMuslimsUseCase CoursesQuran");
    return await muslimRepo.getCoursesOfQuran();
  }

}
