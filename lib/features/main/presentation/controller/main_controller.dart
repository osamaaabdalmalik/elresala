import 'package:elresala/core/constants/app_assets.dart';
import 'package:elresala/core/constants/app_pages_routes.dart';
import 'package:elresala/features/main/domain/entities/home_card_data.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class MainController extends GetxController {
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
      targetScreen: AppPagesRoutes.doaaScreen,
    ),
    HomeCardData(
      title: "Azkar",
      description: "Learn how to pray,Qiblah",
      iconPath: AppAssets.azkar,
      targetScreen: AppPagesRoutes.azkarScreen,
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
      targetScreen: AppPagesRoutes.muslimScreen,
    ),
    HomeCardData(
      title: "Courses for Non Muslim",
      description: "Learn how to pray,Qiblah",
      iconPath: AppAssets.hadith,
      targetScreen: AppPagesRoutes.nonMuslimScreen,
    ),
  ];

  @override
  void onInit() async {
    Get.find<Logger>().i("Start onInit MainController");
    super.onInit();
    Get.find<Logger>().w("End onInit MainController");
  }
}
