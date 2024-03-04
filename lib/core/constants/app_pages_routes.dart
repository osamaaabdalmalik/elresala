// ignore_for_file: constant_identifier_names

import 'package:elresala/features/advanced_learning/presentation/advanced_learning.dart';
import 'package:elresala/features/advanced_learning/presentation/screens/advanced_sites.dart';
import 'package:elresala/features/azkar_doaa/azkar_doaa_bindings.dart';
import 'package:elresala/features/azkar_doaa/presentation/screens/azkar_doaa_screen.dart';
import 'package:elresala/features/azkar_doaa/presentation/screens/content_azkar_screen.dart';
import 'package:elresala/features/hadith/hadith_bindings.dart';
import 'package:elresala/features/hadith/presentation/screens/hadith_screen.dart';
import 'package:elresala/features/main/main_bindings.dart';
import 'package:elresala/features/main/presentation/screens/main_screen.dart';
import 'package:elresala/features/muslim/muslim_bindings.dart';
import 'package:elresala/features/muslim/presentation/screens/muslim_courses_screen.dart';
import 'package:elresala/features/non_muslim/non_muslim_bindings.dart';
import 'package:elresala/features/non_muslim/presentation/screens/non_muslim_screen.dart';
import 'package:elresala/features/quran/presentation/screens/quran_screen.dart';
import 'package:elresala/features/quran/presentation/screens/surah_screen.dart';
import 'package:elresala/features/quran/presentation/screens/telawa_screen.dart';
import 'package:elresala/features/quran/quran_bindings.dart';
import 'package:get/get.dart';

import '../../features/muslim/presentation/screens/muslim_lessons_sub.dart';
import '../../features/muslim/presentation/screens/muslim_courses_sub.dart';
import '../../features/muslim/presentation/screens/muslim_lessons_screen.dart';
import '../../features/muslim/presentation/screens/muslim_view.dart';


abstract class AppPagesRoutes {
  // Tabs Screens
  static const String mainScreen = "/";
  static const String quranScreen = "/quranScreen";
  static const String hadithScreen = "/hadithScreen";
  static const String azkarScreen = "/azkarScreen";
  static const String advanced_learning = "/advanced_learning_Screen";
  static const String doaaScreen = "/doaaScreen";

 // static const String muslimScreen = "/muslimScreen";
  static const String nonMuslimScreen = "/nonMuslimScreen";
  static const String surahScreen = "/surahScreen";
  static const String telawaScreen = "/telawaScreen";
  static const String contentAzkarDoaasScreen = "/content_azkar_screen";

  //MuslimCourse Screen
  static const String muslimScreenCourses = "/muslimScreenCourses";
  static const String muslimScreenCoursesSub = "/muslimScreenCoursesSub";
  static const String muslimview="/muslimview";
  static const String muslimlessons = "/muslimlessons";
  static const String muslimlessonhome = "/muslimlessonhome";


  static List<GetPage<dynamic>> appPages = [
    GetPage(
      name: mainScreen,
      page: () => const MainScreen(),
      binding: MainBindings(),
      // middlewares: [MainMiddleware()],
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
      page: () => const AzkarDoaaScreen(),
      binding: AzkarDoaaBindings(),
      transition: Transition.cupertino,
    ),

    // =========================================================

    GetPage(
      name: advanced_learning,
      page: () => const Advanced_Sites(),
      binding: Advanced_LearningBindings(),
      transition: Transition.cupertino,
    ),

    // =========================================================
            // Main Muslim Screen
    GetPage(
      name: muslimScreenCourses,
      page: () => const MuslimScreenCourses(),
      binding: MuslimBindings(),
      transition: Transition.cupertino,
    ),
        //Lissons Muslim Screen
    GetPage(name: muslimlessons, page:()=>const LissonsMuslim()),
    GetPage(name: muslimview, page: ()=>  MuslimView()),
    GetPage(name: muslimScreenCoursesSub, page:()=>const MuslimScreenCoursesSub()),
    //LissonsHome Muslim Screen
    GetPage(name: muslimlessonhome, page:()=>const LissonHomeMuslim()),
    //=====================================================
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
    GetPage(
      name: contentAzkarDoaasScreen,
      page: () => const ContentAzkarDoaasScreen(),
      transition: Transition.cupertino,
    ),
  ];
}
