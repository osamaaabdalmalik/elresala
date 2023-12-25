import 'package:dartz/dartz.dart';
import 'package:elresala/core/errors/failures.dart';
import 'package:elresala/features/doaa/domain/repository/doaa_repo.dart';
import 'package:elresala/features/hadith/domain/entities/hadith_entity.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class GetDoaasUseCase {
  final DoaaRepo doaaRepo;

  GetDoaasUseCase(this.doaaRepo);

  Future<Either<Failure, List<Hadith>>> call() async {
    Get.find<Logger>().i("Call GetDoaasUseCase");
    return await doaaRepo.getDoaas();
  }
}
