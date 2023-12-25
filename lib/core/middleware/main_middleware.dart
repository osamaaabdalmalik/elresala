import 'package:elresala/core/constants/app_keys.dart';
import 'package:elresala/core/constants/app_pages_routes.dart';
import 'package:elresala/core/services/shared_preferences_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    String? lang = Get.find<SharedPreferencesService>().getData<String>(
      key: AppKeys.currentLanguage,
    );
    if (lang == null) {
      return const RouteSettings(name: AppPagesRoutes.languagesScreen);
    }
    return null;
  }
}
