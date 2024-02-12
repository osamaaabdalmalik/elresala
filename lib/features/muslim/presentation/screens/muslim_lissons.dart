import 'package:elresala/core/constants/app_colors.dart';
import 'package:elresala/core/constants/app_pages_routes.dart';
import 'package:elresala/core/widgets/handle_states_widget.dart';
import 'package:elresala/features/muslim/presentation/Widget/Custom_button_muslim_title.dart';
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
      body: Container(height: double.infinity,
        color: AppColors.kPrimaryColor,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: GetBuilder<MuslimController>(
          builder: (controller) {
            return HandleStatesWidget(
                stateType: controller.getCoursesState,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      CustomMuslimButtonTitle(title: "Lissons"),
                      ...List.generate(
                          controller.namecourses[controller.number].values
                              .firstOrNull[0].lessons.length,
                          (index) => InkWell(onTap: () {
                            Get.toNamed(controller.namecourses[controller.number]["IsMuslimModel"]?
                                AppPagesRoutes.muslimlessonhome:AppPagesRoutes.muslimview
                            );
                            controller.lisson_number=index;
                          },
                            child: CustomMuslimContianer(
                                text: controller.namecourses[controller.number]
                                        ["IsMuslimModel"]
                                    ?  controller
                                    .namecourses[controller.number]
                                    .values
                                    .firstOrNull[0]
                                    .lessons[index]
                                    .header
                                    : controller
                                        .namecourses[controller.number]
                                        .values
                                        .firstOrNull[0]
                                        .lessons[index]
                                        .title),
                          ))
                    ],
                  ),
                ));
          },
        ),
      ),
    );
  }
}
