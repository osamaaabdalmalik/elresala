import 'package:elresala/core/constants/app_colors.dart';
import 'package:elresala/core/widgets/handle_states_widget.dart';
import 'package:elresala/features/muslim/presentation/Widget/custom_text_muslim.dart';
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

        backgroundColor: AppColors.kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                CustomTextMuslim(text: 'Muslim Courses', istitle: true),
                ...List.generate(
                    controller.muslimcoursesname.length,
                        (index) =>
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: InkWell(onTap: () {
                          Get.toNamed(AppPagesRoutes.muslimScreenCoursesSub);
                          controller.course_number=index;
                          controller.getDatafromjson(index);
                        },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.kGreenColor,
                            ),

                            height: 0.2 * Get.height,
                            child: Text(
                              controller.muslimcoursesname[index],
                              style:const TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: AppColors.amber,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),

                    ))
              ],
            ),
          ),
        ));
  }
}
