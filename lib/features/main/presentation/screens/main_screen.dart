import 'package:elresala/core/constants/app_colors.dart';
import 'package:elresala/core/utils/components/appbar/home_appbar.dart';
import 'package:elresala/features/main/presentation/controller/main_controller.dart';
import 'package:elresala/features/main/presentation/widgets/pray_time_widget_section_home_screen.dart';
import 'package:elresala/features/main/presentation/widgets/sections_widgets_home_screen.dart';
import 'package:elresala/features/main/presentation/widgets/time_and_hour_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends GetView<MainController> {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      appBar: HomeAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TimeAndHourWidget(),
            SizedBox(
              height: 12,
            ),
            PrayTimeWidgetSectionHomeScreen(),
            SectionswidgetsHomeScreen(),
          ],
        ),
      ),
    );
  }
}
