import 'package:elresala/core/constants/app_colors.dart';
import 'package:elresala/core/constants/app_pages_routes.dart';
import 'package:elresala/core/widgets/handle_states_widget.dart';
import 'package:elresala/features/muslim/presentation/Widget/custom_text_muslim.dart';
import 'package:elresala/features/muslim/presentation/controller/muslim_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Widget/Custom_Container_muslim.dart';

class LissonsMuslim extends GetView<MuslimController> {
  const LissonsMuslim({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kPrimaryColor,
        elevation: 0,
      ),
      body: Container(
        height: double.infinity,
        color: AppColors.kPrimaryColor,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child:ListView(children: [
          CustomTextMuslim(text: controller
              .DataViewList[controller.course_number]
              .title, istitle: true),
          const SizedBox(
            height: 15,
          ),
          CustomTextMuslim(
              text: controller
                  .DataViewList[controller.course_number]
                  .description,
              istitle: false),
          const SizedBox(
            height: 15,
          ),CustomTextMuslim(text: "Lissons:", istitle: true),
          ...List.generate(
            controller.DataViewList[controller.course_number]
                .lessons.length,
                (index) => CustomMuslimItem(
                onTap: () {
                  Get.toNamed(controller.isMoslimModel
                      ? AppPagesRoutes.muslimlessonhome
                      : AppPagesRoutes.muslimview);
                  controller.lisson_number = index;
                },
                text: controller.isMoslimModel
                    ? controller
                    .DataViewList[controller.course_number]
                    .lessons[index]
                    .header
                    : controller
                    .DataViewList[controller.course_number]
                    .lessons[index]
                    .title),
          )
        ],)
      ),
    );
  }
}
