import 'package:elresala/core/constants/app_colors.dart';
import 'package:elresala/core/utils/components/appbar/home_appbar.dart';
import 'package:elresala/features/home/presentation/widgets/pray_time_widget_section_home_screen.dart';
import 'package:elresala/features/home/presentation/widgets/sections_widgets_home_screen.dart';
import 'package:elresala/features/home/presentation/widgets/time_and_hour_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
