import 'package:elresala/core/constants/app_colors.dart';
import 'package:elresala/core/widgets/handle_states_widget.dart';
import 'package:elresala/features/azkar_doaa/domain/entities/azkar_entity.dart';
import 'package:elresala/features/azkar_doaa/presentation/controller/azkar_doaa_controller.dart';
import 'package:elresala/features/azkar_doaa/presentation/widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';

import '../../../../core/constants/app_pages_routes.dart';
import '../../../../core/widgets/primary_shimmer.dart';

class BodyAzkarScreen extends GetView<AzkarDoaaController> {
  const BodyAzkarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AzkarDoaaController>(
      builder: (controller) => HandleStatesWidget(
        stateType: controller.getAzkarState,
        hasShimmer: true,
        shimmerChild: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(15),
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
        child: ListView.builder(
          padding: const EdgeInsets.all(15),
          itemCount: controller.azkar.length,
          itemBuilder: (BuildContext context, int index) {
            Azkar azkar = controller.azkar[index];
            return CustomListTile(
              navigation: () => Get.toNamed(
                AppPagesRoutes.contentAzkarDoaasScreen,
                arguments: {
                  "label": "azkar",
                  "title": azkar.categoryNameEs,
                  "data": azkar.zikr,
                },
              ),
              title: azkar.categoryNameEs ?? "",
            );
          },
        ),
      ),
    );
  }
}
