import 'package:elresala/core/constants/app_pages_routes.dart';
import 'package:elresala/core/constants/app_themes.dart';
import 'package:elresala/core/constants/app_translations.dart';
import 'package:elresala/intial_bindings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences pref = await SharedPreferences.getInstance();
  Get.put(pref);
  initLang();

  runApp(const MyApp());
}

void initLang() {
  // String? sharedPrefLang = Get.find<SharedPreferences>().getString(AppKeys.lang);
  ThemeData appTheme = AppThemes.themeEnglish;
  Locale language = const Locale("en");
  appTheme = AppThemes.themeEnglish;
  // if (sharedPrefLang == "ar") {
  //   language = const Locale("ar");
  //   appTheme = AppThemes.themeArabic;
  // } else if (sharedPrefLang == "en") {
  //   language = const Locale("en");
  //   appTheme = AppThemes.themeEnglish;
  // } else {
  //   language = Locale(Get.deviceLocale!.languageCode);
  //   if (Get.deviceLocale!.languageCode == "ar") {
  //     appTheme = AppThemes.themeArabic;
  //   } else if (Get.deviceLocale!.languageCode == "en") {
  //     appTheme = AppThemes.themeEnglish;
  //   }
  // }
  Get.put(language);
  Get.put(appTheme);
  // Get.find<SharedPreferences>().setString(AppKeys.lang, Get.deviceLocale!.languageCode);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (_, __) => GetMaterialApp(
        title: 'Elresala',
        debugShowCheckedModeBanner: false,
        locale: Get.find<Locale>(),
        translations: AppTranslations(),
        theme: Get.find<ThemeData>(),
        builder: EasyLoading.init(),
        initialBinding: InitialBindings(),
        getPages: AppPagesRoutes.appPages,
      ),
      designSize: const Size(432, 816),
    );
  }
}
