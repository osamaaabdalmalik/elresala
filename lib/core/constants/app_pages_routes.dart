import 'package:get/get.dart';
import 'package:elresala/features/main/main_bindings.dart';
import 'package:elresala/features/main/presentation/screens/main_screen.dart';

abstract class AppPagesRoutes {
  // Tabs Screens
  static const String mainScreen = "/";

  static List<GetPage<dynamic>> appPages = [
    GetPage(
      name: mainScreen,
      page: () => const MainScreen(),
      binding: MainBindings(),
      transition: Transition.leftToRight,
    ),
  ];
}
