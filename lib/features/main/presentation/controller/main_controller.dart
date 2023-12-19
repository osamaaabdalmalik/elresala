import 'package:elresala/core/constants/app_assets.dart';
import 'package:elresala/core/constants/app_pages_routes.dart';
import 'package:elresala/features/main/domain/entities/home_card_data.dart';
import 'package:elresala/features/main/domain/usecases/download_files_use_case.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class MainController extends GetxController {
  double progress = 0;
  int totalFiles = 0, downloadedFiles = 0;

  List<HomeCardData> homeCardsData = [
    HomeCardData(
      title: "Quran",
      description: "Learn , Read all the Quran",
      iconPath: AppAssets.quran,
      targetScreen: AppPagesRoutes.quranScreen,
    ),
    HomeCardData(
      title: "Calender",
      description: "Data,All holidays and special occasions for Muslims",
      iconPath: AppAssets.calender,
      targetScreen: AppPagesRoutes.mainScreen,
    ),
    HomeCardData(
      title: "Prayer",
      description: "Learn how to pray,Qiblah",
      iconPath: AppAssets.prayer,
      targetScreen: AppPagesRoutes.mainScreen,
    ),
    HomeCardData(
      title: "Dua",
      description: "Learn how to pray,Qiblah",
      iconPath: AppAssets.prayer,
      targetScreen: AppPagesRoutes.mainScreen,
    ),
    HomeCardData(
      title: "Azkar",
      description: "Learn how to pray,Qiblah",
      iconPath: AppAssets.azkar,
      targetScreen: AppPagesRoutes.mainScreen,
    ),
    HomeCardData(
      title: "Hadith",
      description: "Learn how to pray,Qiblah",
      iconPath: AppAssets.hadith,
      targetScreen: AppPagesRoutes.mainScreen,
    ),
    HomeCardData(
      title: "Advanced Learning",
      description: "Learn how to pray,Qiblah",
      iconPath: AppAssets.hadith,
      targetScreen: AppPagesRoutes.mainScreen,
    ),
    HomeCardData(
      title: "Courses for Muslim",
      description: "Learn how to pray,Qiblah",
      iconPath: AppAssets.hadith,
      targetScreen: AppPagesRoutes.mainScreen,
    ),
  ];

  @override
  void onInit() async {
    Get.find<Logger>().i("Start onInit MainController");
    super.onInit();
    Get.find<Logger>().f("End onInit MainController");
  }

  Future<void> downloadFiles() async {
    Get.find<Logger>().i("Start `downloadFiles` in |MainController|");
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
    Get.find<Logger>().f("End `downloadFiles` in |MainController|");
  }
}
