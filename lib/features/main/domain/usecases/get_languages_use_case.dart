import 'package:dartz/dartz.dart';
import 'package:elresala/core/errors/failures.dart';
import 'package:elresala/features/main/domain/entities/language_entity.dart';
import 'package:elresala/features/main/domain/repository/main_repo.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class GetLanguagesUseCase {
  final MainRepo mainRepo;

  GetLanguagesUseCase(this.mainRepo);

  Future<Either<Failure, List<Language>>> call() async {
    Get.find<Logger>().i("Call GetLanguagesUseCase");
    return await mainRepo.getLanguages();
  }
}
