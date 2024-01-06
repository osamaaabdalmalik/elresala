import 'package:elresala/core/middleware/main_middleware.dart';
import 'package:elresala/features/azkar/azkar_bindings.dart';
import 'package:elresala/features/azkar/presentation/screens/azkar_screen.dart';
import 'package:elresala/features/doaa/doaa_bindings.dart';
import 'package:elresala/features/doaa/presentation/screens/doaa_screen.dart';
import 'package:elresala/features/hadith/hadith_bindings.dart';
import 'package:elresala/features/hadith/presentation/screens/hadith_screen.dart';
import 'package:elresala/features/main/main_bindings.dart';
import 'package:elresala/features/main/presentation/screens/languages_screen.dart';
import 'package:elresala/features/main/presentation/screens/main_screen.dart';
import 'package:elresala/features/muslim/muslim_bindings.dart';
import 'package:elresala/features/muslim/presentation/screens/muslim_screen.dart';
import 'package:elresala/features/non_muslim/non_muslim_bindings.dart';
import 'package:elresala/features/non_muslim/presentation/screens/non_muslim_screen.dart';
import 'package:elresala/features/quran/presentation/screens/quran_screen.dart';
import 'package:elresala/features/quran/presentation/screens/surah_screen.dart';
import 'package:elresala/features/quran/presentation/screens/telawa_screen.dart';
import 'package:elresala/features/quran/quran_bindings.dart';
import 'package:get/get.dart';

abstract class AppPagesRoutes {
  // Tabs Screens
  static const String mainScreen = "/";
  static const String languagesScreen = "/languagesScreen";
  static const String quranScreen = "/quranScreen";
  static const String hadithScreen = "/hadithScreen";
  static const String azkarScreen = "/azkarScreen";
  static const String doaaScreen = "/doaaScreen";
  static const String muslimScreen = "/muslimScreen";
  static const String nonMuslimScreen = "/nonMuslimScreen";
  static const String surahScreen = "/surahScreen";
  static const String telawaScreen = "/telawaScreen";

  static List<GetPage<dynamic>> appPages = [
    GetPage(
      name: mainScreen,
      page: () => const MainScreen(),
      binding: MainBindings(),
      middlewares: [MainMiddleware()],
      transition: Transition.cupertino,
    ),
    GetPage(
      name: languagesScreen,
      page: () => const LanguagesScreen(),
      binding: MainBindings(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: quranScreen,
      page: () => const QuranScreen(),
      binding: QuranBindings(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: hadithScreen,
      page: () => const HadithScreen(),
      binding: HadithBindings(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: azkarScreen,
      page: () => const AzkarScreen(),
      binding: AzkarBindings(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: doaaScreen,
      page: () => const DoaaScreen(),
      binding: DoaaBindings(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: muslimScreen,
      page: () => const MuslimScreen(),
      binding: MuslimBindings(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: nonMuslimScreen,
      page: () => const NonMuslimSectionScreen(),
      binding: NonMuslimBindings(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: surahScreen,
      page: () => const SurahScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: telawaScreen,
      page: () => const TelawaScreen(),
      transition: Transition.cupertino,
    ),
  ];
}
