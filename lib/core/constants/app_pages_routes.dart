import 'package:elresala/features/hadith/hadith_screen.dart';
import 'package:elresala/features/quran/presentation/screens/quran_view.dart';
import 'package:get/get.dart';
import 'package:elresala/features/main/main_bindings.dart';
import 'package:elresala/features/main/presentation/screens/main_screen.dart';

abstract class AppPagesRoutes {
  // Tabs Screens
  // static const String mainScreen = "/";
  static const String hadithScreen = "/";

  // static const String hadithScreen='hadithScreen';
  // static const String quranScreen='quranScreen';


  static List<GetPage<dynamic>> appPages = [
    // GetPage(
    //   name: mainScreen,
    //   page: () => const MainScreen(),
    //   binding: MainBindings(),
    //   transition: Transition.leftToRight,
    // ),
    GetPage(
      name:hadithScreen ,
      page: () => const HadithScreen(),
      binding: MainBindings(),
      transition: Transition.leftToRight,
    ),
    // GetPage(
    //   name:quranScreen ,
    //   page: () => const QuranView(),
    //   binding: MainBindings(),
    //   transition: Transition.leftToRight,
    // ),
  ];
}
