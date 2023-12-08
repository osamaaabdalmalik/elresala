
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class QuranController extends GetxController{

  @override
  void onInit() {
    Get.find<Logger>().i("Start onInit QuranController");
    super.onInit();
    Get.find<Logger>().f("End onInit QuranController");
  }

}