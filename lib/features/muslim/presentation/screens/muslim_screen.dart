import 'package:elresala/core/constants/app_colors.dart';
import 'package:elresala/core/widgets/handle_states_widget.dart';
import 'package:elresala/features/muslim/presentation/controller/muslim_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MuslimScreenCourses extends GetView<MuslimController> {
  const MuslimScreenCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(backgroundColor: AppColors.kGreenColor,elevation: 0),drawer:const Icon(Icons.arrow_back),
        backgroundColor: AppColors.kPrimaryColor,
        body: GetBuilder<MuslimController>(builder: (controller) {
        /*  List<String> x = controller.courses[0].lessons[0].nestedTopics
              .map((e) => e.title)
              .toList();*/
          return HandleStatesWidget(
              stateType: controller.getCoursesState,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Text("Course"),
                      ...List.generate(
                          6,
                          (index) => Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)
                            ,color: AppColors.kGreenColor,
                            )
                            ,margin: const EdgeInsets.symmetric(vertical: 20),
                                height: 0.2 * Get.height,
                                
                              ))
                    ],
                  ),
                ),
              ));
        }));
  }
}
