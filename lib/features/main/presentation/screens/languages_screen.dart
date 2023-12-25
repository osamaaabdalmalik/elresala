import 'package:elresala/core/constants/app_assets.dart';
import 'package:elresala/core/constants/app_colors.dart';
import 'package:elresala/core/constants/app_enums.dart';
import 'package:elresala/core/widgets/handle_states_widget.dart';
import 'package:elresala/core/widgets/primary_shimmer.dart';
import 'package:elresala/features/main/presentation/controller/languages_controller.dart';
import 'package:elresala/features/main/presentation/widgets/download_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LanguagesScreen extends GetView<LanguagesController> {
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
        child: ListView(
          physics: controller.getLanguagesState == StateType.loading ? const NeverScrollableScrollPhysics() : null,
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
            GetBuilder<LanguagesController>(
              builder: (controller) => HandleStatesWidget(
                stateType: controller.getLanguagesState,
                hasShimmer: true,
                shimmerChild: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => PrimaryShimmer.rectangle(
                    height: Get.height * 0.09,
                    color: AppColors.kGreenColor,
                    border: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 15,
                  ),
                  itemCount: 6,
                ),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    if (controller.selectedLanguage != null)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Selected Language",
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.kWhiteColor,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          DownloadCard(
                            title: controller.selectedLanguage!.name,
                            progress: controller.progress,
                            isDownloaded: controller.selectedLanguage!.isDownloaded,
                            downloadedCount: controller.downloadedFiles,
                            totalCount: controller.totalFiles,
                            onDownloadTab: () async {},
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            "All Languages",
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.kWhiteColor,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ...List.generate(controller.languages.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: InkWell(
                          onTap: (!controller.languages[index].isDownloaded ||
                                  (controller.selectedLanguage != null &&
                                      controller.languages[index].name == controller.selectedLanguage!.name))
                              ? null
                              : () async {
                                  await controller.showMakeLangAsDefaultDialog(index: index);
                                },
                          borderRadius: BorderRadius.circular(15),
                          child: DownloadCard(
                            title: controller.languages[index].name,
                            isDownloaded: controller.languages[index].isDownloaded,
                            progress: controller.progressList[index],
                            downloadedCount: controller.downloadedFilesList[index],
                            totalCount: controller.totalFilesList[index],
                            onDownloadTab: controller.downloadLanguagesState != StateType.loading
                                ? () async {
                                    await controller.downloadFiles(
                                      index: index,
                                    );
                                  }
                                : null,
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
