import 'package:dartz/dartz.dart';
import 'package:elresala/features/muslim/domain/entities/muslim_entity.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:logger/logger.dart';

import '../../../../core/errors/failures.dart';
import '../../data/models/muslim_model_main.dart';
import '../repository/muslim_repo.dart';

class GetCoursesMoomlatUseCase {
  final MuslimRepo muslimRepo;

  GetCoursesMoomlatUseCase(this.muslimRepo);

  Future<Either<Failure, List<Muslim>>> call() async {
    Get.find<Logger>().i("Call GetMuslimsUseCase CoursesMoomlat");
    return await muslimRepo.getCoursesOfMoomlat();
  }

}