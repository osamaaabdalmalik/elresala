import 'package:dartz/dartz.dart';
import 'package:elresala/core/errors/failures.dart';
import 'package:elresala/core/services/firebase_storage_service.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class DownloadFilesUseCase {
  final FirebaseStorageService firebaseStorageService;

  DownloadFilesUseCase(this.firebaseStorageService);

  Future<Either<Failure, Unit>> call({
    required String language,
    required Function(int totalFiles, int downloadedFiles) onProgressFiles,
    required Function(double progress) onProgressFile,
  }) async {
    Get.find<Logger>().i("Call DownloadFilesUseCase");
    return await firebaseStorageService.downloadFiles(
      language: language,
      onProgressFiles: onProgressFiles,
      onProgressFile: onProgressFile,
    );
  }
}
