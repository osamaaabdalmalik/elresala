
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class MainController extends GetxController{

  @override
  void onInit() {
    Get.find<Logger>().i("Start onInit MainController");
    super.onInit();
    Get.find<Logger>().f("End onInit MainController");
  }

}