import 'package:elresala/core/constants/app_colors.dart';
import 'package:elresala/features/doaa/presentation/controller/doaa_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoaaScreen extends GetView<DoaaController> {
  const DoaaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      body: Center(
        child: Text("DoaaScreen"),
      ),
    );
  }
}
