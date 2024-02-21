import 'package:elresala/core/constants/app_colors.dart';
import 'package:elresala/core/constants/app_pages_routes.dart';
import 'package:elresala/core/widgets/handle_states_widget.dart';
import 'package:elresala/features/muslim/presentation/Widget/Custom_Container_muslim.dart';
import 'package:elresala/features/muslim/presentation/Widget/custom_text_muslim.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/muslim_controller.dart';

class MuslimScreenCoursesSub extends GetView<MuslimController> {
  const MuslimScreenCoursesSub({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kPrimaryColor,
        elevation: 0,
      ),
      backgroundColor: AppColors.kPrimaryColor,
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
          child: GetBuilder<MuslimController>(
            builder: (controller) {

              return HandleStatesWidget(
                stateType: controller.getCoursesState,
                child: SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextMuslim(text:  controller.muslimcoursesname[controller.course_number] + " Courses:", istitle: true),
                        ...List.generate(
                            controller.DataViewList.length,
                            (index) => CustomMuslimItem(onTap: () {
                              Get.toNamed(AppPagesRoutes.muslimlessons);
                              controller.course_number=index;
                            },
                              text:controller.DataViewList[index].title,
                            ))
                      ],
                    ),
                  ),
                ),
              );
            },
          )),
    );
  }
}
