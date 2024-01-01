import 'package:elresala/core/constants/app_colors.dart';
import 'package:elresala/features/azkar/presentation/controller/azkar_controller.dart';
import 'package:elresala/features/azkar/presentation/widgets/body_azkar_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AzkarScreen extends GetView<AzkarController> {
  const AzkarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 4,
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
          ],
          backgroundColor: AppColors.kPrimaryColor,
          bottom: const TabBar(
            indicatorColor: AppColors.kGoldenColor,
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: AppColors.kWhiteColor,
            unselectedLabelColor: AppColors.kWhiteColor,
            dividerColor: AppColors.transparent,
            tabs: [
              Tab(text: 'text'),
              Tab(text: 'text'),
              Tab(text: 'text'),
              Tab(text: 'text'),
              Tab(text: 'Azkar'),
            ],
          ),
        ),
        backgroundColor: AppColors.kPrimaryColor,
        body: const TabBarView(
          children: [
            Text('text'),
            Text('text'),
            Text('text'),
            Text('text'),
            BodyAzkarScreenPage(),
          ],
        ),
      ),
    );
  }
}
