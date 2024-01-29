import 'package:elresala/core/constants/app_keys.dart';
import 'package:elresala/features/sites/data/get_site_data.dart';
import 'package:get/get.dart';

abstract class LearningIslamController extends GetxController {
  getHomeData();
}

class LearningIslamControllerImp extends LearningIslamController {
  List title = [];
  List titleSubCatigory = [];
  Map temprory = {};

  @override
  getHomeData() async {
    List response =
        await HomeData().getData(AppKeys.learningIslam, "learning-islam");
    title.clear();
    for (var element in response) {
      title.add(element["name"]);
      List titleCatigory = [];
      Map titletemprory = {};
      for (var element1 in element['subcategories']) {
        titleCatigory.add(element1['name']);
        titletemprory.addAll({element1['name']: element1['lessons']});
      }
      temprory.addAll(titletemprory);
      titleSubCatigory.add(titleCatigory);
    }
    update();
  }

  @override
  void onInit() {
    getHomeData();
    super.onInit();
  }
}
