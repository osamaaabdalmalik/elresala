import 'package:elresala/core/constants/app_pages_routes.dart';
import 'package:elresala/core/widgets/handle_states_widget.dart';
import 'package:elresala/features/muslim/presentation/Widget/Custom_Container_muslim.dart';
import 'package:elresala/features/muslim/presentation/Widget/custom_text_muslim.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_colors.dart';
import '../controller/muslim_controller.dart';

class LissonHomeMuslim extends GetView<MuslimController> {
  const LissonHomeMuslim({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.kPrimaryColor,
          elevation: 0,
        ),
        body: Container(
            color: AppColors.kPrimaryColor,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: ListView(
              children: [

              CustomTextMuslim(text: "nestedTopics", istitle: true),
                ...List.generate(
                    controller.DataViewList[controller.course_number]
                        .lessons[controller.lisson_number].nestedTopics.length,
                    (index) => CustomMuslimItem(
                        onTap: () {
                          Get.toNamed(AppPagesRoutes.muslimview);
                          controller.artical_number = index;

                        },
                        text: controller
                            .DataViewList[controller.course_number]
                            .lessons[controller.lisson_number]
                            .nestedTopics[index]
                            .title))
              ],
            )));
  }
}
