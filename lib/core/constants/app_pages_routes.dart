import 'package:elresala/core/middleware/main_middleware.dart';
import 'package:elresala/features/main/main_bindings.dart';
import 'package:elresala/features/main/presentation/screens/languages_screen.dart';
import 'package:elresala/features/main/presentation/screens/main_screen.dart';
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
