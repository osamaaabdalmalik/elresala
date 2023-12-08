import 'package:elresala/core/constants/app_colors.dart';
import 'package:elresala/features/quran/presentation/controller/quran_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuranScreen extends GetView<QuranController> {
  const QuranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Quran Screen",
        style: TextStyle(
          fontSize: 40,
          color: AppColors.primary,
        ),
      ),
    );
  }
}
