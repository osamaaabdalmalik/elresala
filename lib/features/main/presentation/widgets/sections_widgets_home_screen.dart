import 'package:elresala/core/constants/app_colors.dart';
import 'package:elresala/features/main/presentation/controller/main_controller.dart';
import 'package:elresala/features/main/presentation/widgets/home_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SectionswidgetsHomeScreen extends GetView<MainController> {
  const SectionswidgetsHomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.kWhiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(children: [
          const SizedBox(
            height: 25,
          ),
          ...List.generate(
            controller.homeCardsData.length,
            (index) => HomeCard(
              homeCardData: controller.homeCardsData[index],
            ),
          )
        ]),
      ),
    );
  }
}
