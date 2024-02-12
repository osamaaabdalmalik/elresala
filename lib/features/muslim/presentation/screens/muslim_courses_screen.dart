import 'package:elresala/core/constants/app_colors.dart';
import 'package:elresala/core/widgets/handle_states_widget.dart';
import 'package:elresala/features/muslim/presentation/controller/muslim_controller.dart';
import 'package:elresala/features/muslim/presentation/screens/muslim_courses_sub.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_pages_routes.dart';

class MuslimScreenCourses extends GetView<MuslimController> {
  const MuslimScreenCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: AppColors.kPrimaryColor, elevation: 0),
        //drawer: const Icon(Icons.arrow_back),
        backgroundColor: AppColors.kPrimaryColor,
        body: GetBuilder<MuslimController>(builder: (controller) {
          return HandleStatesWidget(
              stateType: controller.getCoursesState,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      const Text(
                        "Course",
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 25,
                            color: AppColors.amber,
                            fontWeight: FontWeight.bold),
                      ),
                      ...List.generate(
                          controller.namecourses.length,
                          (index) => InkWell(
                                onTap: () {
                                  Get.toNamed(AppPagesRoutes.muslimScreenCoursesSub);
                                  controller.number = index;
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: AppColors.kGreenColor,
                                  ),
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 20),
                                  height: 0.2 * Get.height,
                                  child: Text(
                                    controller.namecourses[index].keys.first,
                                    style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        color: AppColors.amber,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ))
                    ],
                  ),
                ),
              ));
        }));
  }
}
