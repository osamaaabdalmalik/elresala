import 'package:elresala/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppBarCustom {
  final String title;
  const AppBarCustom({required this.title});

  AppBar customAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.kPrimaryColor,
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(
            color: AppColors.kGoldenColor, fontWeight: FontWeight.bold),
      ),
    );
  }
}
