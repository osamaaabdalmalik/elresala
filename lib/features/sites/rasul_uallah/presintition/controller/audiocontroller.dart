import 'package:elresala/features/sites/data/get_site_data.dart';
import 'package:get/get.dart';

abstract class AudioController extends GetxController {
  getAudioData();
}

class AudioControllerImp extends AudioController {
  List dataAudioKey = [];
  List dataAudioTitle = [];
  List dataAudioLink = [];

  @override
  getAudioData() async {
    Map response =
        await HomeData().getData("assets/rasulu_allah.json", "RasuluAllah");

    dataAudioKey.clear();
    dataAudioLink.clear();
    dataAudioTitle.clear();

    response['Audios'].forEach((key, value) {
      List title = [];
      List link = [];
      dataAudioKey.add(key);
      title.addAll(value.keys);
      link.addAll(value.values);
      dataAudioTitle.add(title);
      dataAudioLink.add(link);
    });

    update();
  }

  @override
  void onInit() {
    getAudioData();
    super.onInit();
  }
}
