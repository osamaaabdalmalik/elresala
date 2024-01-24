import 'package:elresala/features/sites/data/get_site_data.dart';
import 'package:get/get.dart';

abstract class BookController extends GetxController {
  getBookData();
}

class BookControllerImp extends BookController {
  List dataBookKey = [];
  List dataBookLink = [];
  List dataBookTitle = [];

  @override
  getBookData() async {
    Map response =
        await HomeData().getData("assets/rasulu_allah.json", "RasuluAllah");

    dataBookKey.clear();
    dataBookLink.clear();
    dataBookTitle.clear();

    response['Books'].forEach((key, value) {
      List title = [];
      List link = [];
      dataBookKey.add(key);
      title.addAll(value.keys);
      link.addAll(value.values);
      dataBookTitle.add(title);
      dataBookLink.add(link);
    });

    update();
  }

  @override
  void onInit() {
    getBookData();
    super.onInit();
  }
}
