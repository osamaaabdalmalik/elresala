import 'package:elresala/features/main/domain/usecases/download_files_use_case.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class MainController extends GetxController {
  double progress = 0;
  int totalFiles = 0, downloadedFiles = 0;

  @override
  void onInit() async {
    Get.find<Logger>().i("Start onInit MainController");
    super.onInit();
    DownloadFilesUseCase downloadFilesUseCase = DownloadFilesUseCase(Get.find());
    await downloadFilesUseCase(
      language: 'spanish',
      onProgressFile: (progress) {
        this.progress = progress;
        update();
      },
      onProgressFiles: (totalFiles, downloadedFiles) {
        this.totalFiles = totalFiles;
        this.downloadedFiles = downloadedFiles;
        update();
      },
    );
    Get.find<Logger>().f("End onInit MainController");
  }
}
