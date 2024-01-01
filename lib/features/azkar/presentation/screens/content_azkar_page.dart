import 'package:elresala/core/constants/app_colors.dart';
import 'package:elresala/features/azkar/presentation/widgets/body_content_page.dart';
import 'package:flutter/material.dart';

class ContentAzkarPage extends StatelessWidget {
  const ContentAzkarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.kPrimaryColor,
        titleTextStyle: const TextStyle(
          color: AppColors.kGoldenColor,
          fontWeight: FontWeight.bold,
          fontSize: 20,
          fontFamily: 'Poppins',
          letterSpacing: 1.5,
          height: 1.5,
          decoration: TextDecoration.none,
          decorationColor: AppColors.kWhiteColor,
          decorationStyle: TextDecorationStyle.solid,
          decorationThickness: 1,
        ),
        title: const Text('Moarning Souvenir'),
        centerTitle: true,
      ),
      body: const BodyContentPage(),
    );
  }
}
