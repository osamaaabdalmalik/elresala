import 'package:elresala/core/constants/app_colors.dart';
import 'package:elresala/features/azkar/presentation/controller/azkar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/body_azkar_screen.dart';

class AzkarScreen extends GetView<AzkarController> {
  const AzkarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Azkar',
          style: TextStyle(
            color: AppColors.kGoldenColor,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
        backgroundColor: AppColors.kPrimaryColor,
      ),
      backgroundColor: AppColors.kPrimaryColor,
      body: const BodyAzkarScreenPage(),
    );
  }
}
