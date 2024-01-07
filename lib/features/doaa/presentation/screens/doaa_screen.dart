import 'package:elresala/core/constants/app_colors.dart';
import 'package:elresala/features/doaa/presentation/Widgets/body_doaa_screen.dart';
import 'package:elresala/features/doaa/presentation/controller/doaa_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoaaScreen extends GetView<DoaaController> {
  const DoaaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.kPrimaryColor,
        title: const Text(
          'Doaa',
          style: TextStyle(
            color: AppColors.kGoldenColor,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
      body: const BodyDoaaScreen(),
    );
  }
}
