import 'package:get/get.dart';
import 'package:elresala/features/sites/data/get_site_data.dart';

abstract class HomeController extends GetxController {
  getHomeData();
}

class HomeControllerImp extends HomeController {
  List data = [];
  List artical = [];

  @override
  getHomeData() async {
    Map response = await HomeData().getData(
        "assets/islam_religion_of_peace.json", "islam-Religion-of-peace");
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
