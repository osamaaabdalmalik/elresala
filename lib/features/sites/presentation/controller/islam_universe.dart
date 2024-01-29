import 'package:elresala/core/constants/app_keys.dart';
import 'package:elresala/features/sites/data/get_site_data.dart';
import 'package:get/get.dart';

abstract class IslamUniverseController extends GetxController {
  getHomeData();
}

class IslamUniverseControllerImp extends IslamUniverseController {
  List title = [];
  List artical = [];

  @override
  getHomeData() async {
    Map response =
        await HomeData().getData(AppKeys.islamUniverse, "islam-universe");
    title.clear();
    artical.clear();
    response.forEach((key, value) {
      title.add(key);
      artical.addAll(value.values);
    });
    update();
  }

  @override
  void onInit() {
    getHomeData();
    super.onInit();
  }
}
