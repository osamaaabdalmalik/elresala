import 'package:elresala/core/constants/app_colors.dart';
import 'package:elresala/features/azkar/presentation/controller/azkar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AzkarScreen extends GetView<AzkarController> {
  const AzkarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      body: Center(
        child: Text("AzkarScreen"),
      ),
    );
  }
}
