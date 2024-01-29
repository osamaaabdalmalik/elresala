import 'package:elresala/core/constants/app_keys.dart';
import 'package:elresala/features/sites/data/get_site_data.dart';
import 'package:get/get.dart';

abstract class IslamPortController extends GetxController {
  getHomeData();
}

class IslamPortControllerImp extends IslamPortController {
  List title = [];
  List artical = [];

  @override
  getHomeData() async {
    Map response = await HomeData().getData(AppKeys.islamPort, "islam-port");
    title.clear();
    artical.clear();
    response.forEach((key, value) {
      title.add(key);
      artical.add(value);
    });
    update();
  }

  @override
  void onInit() {
    getHomeData();
    super.onInit();
  }
}
