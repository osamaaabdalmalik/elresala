import 'package:elresala/core/widgets/handle_states_widget.dart';
import 'package:elresala/features/muslim/presentation/Widget/Custom_Container_muslim.dart';
import 'package:elresala/features/muslim/presentation/Widget/Custom_button_muslim_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_colors.dart';
import '../controller/muslim_controller.dart';

class LissonHomeMuslim extends StatelessWidget {
  const LissonHomeMuslim({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kPrimaryColor,
        elevation: 0,
      ),
      body: GetBuilder<MuslimController>(
        builder: (controller) => Container(
          color: AppColors.kPrimaryColor,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: GetBuilder<MuslimController>(builder: (controller) {
            return HandleStatesWidget(
                stateType: controller.getCoursesState,
                child: Column(
                  children: [SizedBox(width: Get.width),
                    CustomMuslimButtonTitle(
                      title: "nestedTopics",
                    ),
                    ...List.generate(
                      controller
                            .namecourses[controller.number]
                            .values
                            .firstOrNull[0]
                            .lessons[controller.lisson_number]
                            .nestedTopics
                            .length,
                        (index) => CustomMuslimContianer(text:controller
                            .namecourses[controller.number]
                            .values
                            .firstOrNull[0]
                            .lessons[controller.lisson_number]
                            .nestedTopics
                            .title)
                    )
                  ],
                ));
          }),
        ),
      ),
    );
  }
}
