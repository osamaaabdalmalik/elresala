import 'package:elresala/core/constants/app_keys.dart';
import 'package:elresala/features/sites/data/get_site_data.dart';
import 'package:get/get.dart';

abstract class ExploreIslamController extends GetxController {
  getHomeData();
}

class ExploreIslamControllerImp extends ExploreIslamController {
  List title = [];
  List artical = [];

  @override
  getHomeData() async {
    List response =
        await HomeData().getData(AppKeys.exploreIslam, "explore-islam");
    title.clear();
    artical.clear();
    for (var element in response) {
        title.add(element["Title"]);
        artical.add(element["content"]);
      }
    update();
  }

  @override
  void onInit() {
    getHomeData();
    super.onInit();
  }
}
