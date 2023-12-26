import 'package:elresala/core/constants/app_colors.dart';
import 'package:elresala/features/non_muslim/presentation/controller/non_muslim_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NonMuslimScreen extends GetView<NonMuslimController> {
  const NonMuslimScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      body: Center(
        child: Text("NonMuslimScreen"),
      ),
    );
  }
}
