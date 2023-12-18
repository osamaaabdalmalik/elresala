import 'package:elresala/core/constants/app_assets.dart';
import 'package:elresala/core/constants/app_colors.dart';
import 'package:elresala/features/main/presentation/controller/main_controller.dart';
import 'package:elresala/features/main/presentation/widgets/downlaod_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LanguagesScreen extends GetView<MainController> {
  const LanguagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.kPrimaryColor,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Languages",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: AppColors.kGoldenColor,
                  ),
                ),
                SvgPicture.asset(AppAssets.logo),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            GetBuilder<MainController>(
              builder: (controller) => ListView(
                shrinkWrap: true,
                children: [
                  DownloadCard(
                    title: "Spanish",
                    progress: controller.progress,
                    downloadedCount: controller.downloadedFiles,
                    totalCount: controller.totalFiles,
                    onDownloadTab: () async {
                      await controller.downloadFiles();
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
