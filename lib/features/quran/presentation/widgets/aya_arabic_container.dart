import 'package:elresala/features/quran/presentation/widgets/aya_text.dart';
import 'package:flutter/material.dart';

import 'package:elresala/core/constants/app_colors.dart';
class AyaArabicContainer extends StatelessWidget {
  const AyaArabicContainer({super.key});

  @override
  Widget build(BuildContext context) {
    String ayaArabic =
        'بسم الله الرحمن الرحيم بسم الله الرحمن الرحيم بسم الله الرحمن الرحيم بسم الله الرحمن الرحيم بسم الله الرحمن الرحيم بسم الله الرحمن الرحيم بسم الله الرحمن الرحيم بسم الله الرحمن الرحيم بسم الله الرحمن الرحيم ';

    int ayaNumber = 5;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: AppColors.kGreenColor,
      ),
      child: AyaText(aya: ayaArabic, ayaNumber: ayaNumber),
    );
  }
}
