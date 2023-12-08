import 'package:elresala/core/constants/app_colors.dart';
import 'package:elresala/features/main/presentation/controller/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends GetView<MainController> {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Main Screen",
        style: TextStyle(
          fontSize: 40,
          color: AppColors.primary,
        ),
      ),
    );
  }
}
