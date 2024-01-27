import 'package:elresala/core/constants/app_keys.dart';
import 'package:elresala/features/sites/data/get_site_data.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {
  getHomeData();
}

class HomeControllerImp extends HomeController {
  List data = [];
  List artical = [];

  @override
  getHomeData() async {
    Map response =
        await HomeData().getData(AppKeys.loveInIslam, "love-in-islam");
    data.clear();
    artical.clear();
    data.addAll(response.keys);
    artical.addAll(response.values);
    update();
  }

  @override
  void onInit() {
    getHomeData();
    super.onInit();
  }
}
