import 'package:dartz/dartz.dart';
import 'package:elresala/core/errors/failures.dart';
import 'package:elresala/features/muslim/data/models/muslim_model.dart';
import 'package:elresala/features/muslim/domain/repository/muslim_repo.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class GetCoursesUseCase {
  final MuslimRepo muslimRepo;

  GetCoursesUseCase(this.muslimRepo);

  Future<Either<Failure, List<MuslimModel>>> call() async {
    Get.find<Logger>().i("Call GetMuslimsUseCase");
    return await muslimRepo.getCourses();
  }
}
