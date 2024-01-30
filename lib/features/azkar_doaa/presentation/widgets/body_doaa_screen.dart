import 'package:elresala/core/constants/app_colors.dart';
import 'package:elresala/core/widgets/handle_states_widget.dart';
import 'package:elresala/features/azkar_doaa/domain/entities/doaa_entity.dart';
import 'package:elresala/features/azkar_doaa/presentation/controller/azkar_doaa_controller.dart';
import 'package:elresala/features/azkar_doaa/presentation/widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';

import '../../../../core/constants/app_pages_routes.dart';
import '../../../../core/widgets/primary_shimmer.dart';

class BodyDoaaScreen extends GetView<AzkarDoaaController> {
  const BodyDoaaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DoaaLang? doaaLang;
    if (controller.doaas != null) {
      doaaLang = controller.doaas!.es;
    }
    return GetBuilder<AzkarDoaaController>(
      builder: (controller) => HandleStatesWidget(
        stateType: controller.getDoaaState,
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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                buildCustomListTile(
                  doaaLang?.etiquetteOfSupplication ?? [],
                  'Etiquette of Supplication',
                ),
                buildCustomListTile(
                  doaaLang?.etiquetteOfSupplication ?? [],
                  'Evening remembrance supplications',
                ),
                buildCustomListTile(
                  doaaLang?.etiquetteOfSupplication ?? [],
                  'Incantations supplications',
                ),
                buildCustomListTile(
                  doaaLang?.etiquetteOfSupplication ?? [],
                  'Morning remembrance supplications',
                ),
                buildCustomListTile(
                  doaaLang?.etiquetteOfSupplication ?? [],
                  'Praises Allah Almighty',
                ),
                buildCustomListTile(
                  doaaLang?.etiquetteOfSupplication ?? [],
                  'Prophetic supplications',
                ),
                buildCustomListTile(
                  doaaLang?.etiquetteOfSupplication ?? [],
                  'Quranic Supplications',
                ),
                buildCustomListTile(
                  doaaLang?.etiquetteOfSupplication ?? [],
                  'Things that Prophet sought refuge [with Allah]',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCustomListTile(List data, String title) {
    return CustomListTile(
      navigation: () => Get.toNamed(
        AppPagesRoutes.contentAzkarDoaasScreen,
        arguments: {
          "label": "doaas",
          "title": title,
          "data": data,
        },
      ),
      title: title,
    );
  }
}
