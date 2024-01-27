import 'package:elresala/core/constants/app_keys.dart';
import 'package:elresala/features/sites/data/get_site_data.dart';
import 'package:get/get.dart';

abstract class ArticalController extends GetxController {
  getAudioData();
}

class ArticalControllerImp extends ArticalController {
  List dataArticalKey = [];
  List dataArticalTitle = [];
  List dataArticalContatin = [];

  List title = [];
  List text = [];

  @override
  getAudioData() async {
    Map response = await HomeData().getData(AppKeys.rasuluAllah, "RasuluAllah");

    dataArticalKey.clear();
    dataArticalContatin.clear();
    dataArticalTitle.clear();

    response['articles']['categorries'].forEach((key, value) {
      List title = [];
      List text = [];
      dataArticalKey.add(key);
      title.addAll(value.keys);
      text.addAll(value.values);
      dataArticalTitle.add(title);
      dataArticalContatin.add(text);
    });
    update();
  }

  @override
  void onInit() {
    getAudioData();
    super.onInit();
  }
}
