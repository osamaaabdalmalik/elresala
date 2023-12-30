import 'package:elresala/core/constants/app_colors.dart';
import 'package:elresala/core/widgets/handle_states_widget.dart';
import 'package:elresala/features/muslim/presentation/controller/muslim_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MuslimScreen extends GetView<MuslimController> {
  const MuslimScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.kPrimaryColor,
        body: GetBuilder<MuslimController>(builder: (controller) {
          return HandleStatesWidget(
            stateType: controller.getCoursesState,
            child: const Center(
              child: Text("MuslimScreen"),
            ),
          );
        }));
  }
}
