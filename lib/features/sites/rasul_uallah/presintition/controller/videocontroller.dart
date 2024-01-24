import 'package:elresala/features/sites/data/get_site_data.dart';
import 'package:get/get.dart';

abstract class VideoController extends GetxController {
  getVideoData();
}

class VideoControllerImp extends VideoController {
  List dataVideoKey = [];
  List dataVideoTitle = [];
  List dataVideoLink = [];

  @override
  getVideoData() async {
    Map response =
        await HomeData().getData("assets/rasulu_allah.json", "RasuluAllah");

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
