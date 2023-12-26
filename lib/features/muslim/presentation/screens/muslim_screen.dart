import 'package:elresala/core/constants/app_colors.dart';
import 'package:elresala/features/muslim/presentation/controller/muslim_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MuslimScreen extends GetView<MuslimController> {
  const MuslimScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      body: Center(
        child: Text("MuslimScreen"),
      ),
    );
  }
}
