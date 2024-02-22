import 'package:elresala/core/constants/app_keys.dart';
import 'package:elresala/features/sites/data/get_site_data.dart';
import 'package:get/get.dart';

abstract class RasulVideoController extends GetxController {
  getVideoData();
}

class RasulVideoControllerImp extends RasulVideoController {
  List dataVideoKey = [];
  List dataVideoTitle = [];
  List dataVideoLink = [];

  @override
  getVideoData() async {
    Map response = await HomeData().getData(AppKeys.rasuluAllah, "RasuluAllah");

    dataVideoKey.clear();
    dataVideoLink.clear();
    dataVideoTitle.clear();

    response['Videos'].forEach((key, value) {
      List title = [];
      List text = [];
      dataVideoKey.add(key);
      title.addAll(value.keys);
      text.addAll(value.values);
      dataVideoTitle.add(title);
      dataVideoLink.add(text);
    });

    update();
  }

  @override
  void onInit() {
    getVideoData();
    super.onInit();
  }
}
