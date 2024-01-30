import 'package:elresala/core/helpers/network_info.dart';
import 'package:elresala/core/services/api_service.dart';
import 'package:elresala/core/services/archive_service.dart';
import 'package:elresala/core/services/easy_loader_service.dart';
import 'package:elresala/core/services/shared_preferences_service.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:logger/logger.dart';

class InitialBindings extends Bindings {
  @override
  dependencies() async {
    Get.put(Logger());
    Get.put(EasyLoaderService());
    Get.put(SharedPreferencesService(pref: Get.find()));
    Get.put(InternetConnectionChecker());
    Get.put<NetworkInfo>(NetworkInfoImpl(Get.find()));
    Get.put(
      ApiService(
        client: http.Client(),
        networkInfo: Get.find(),
      ),
    );
    Get.put(
      ArchiveService(sharedPreferencesService: Get.find()),
    );
  }
}
