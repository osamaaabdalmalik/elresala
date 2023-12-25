import 'package:elresala/core/styles/text_styles.dart';
import 'package:elresala/features/quran/presentation/widgets/aya_text.dart';
import 'package:flutter/material.dart';

import 'package:elresala/core/constants/app_colors.dart';

class HadithItemWidget extends StatelessWidget {
  const HadithItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    String hadith =
        ' حديث حديث حديث حديث حديث  حديث حديث حديث حديث حديث  حديث حديث حديث حديث حديث  حديث حديث حديث حديث حديث  حديث حديث حديث حديث حديث  حديث حديث حديث حديث حديث  حديث حديث حديث حديث حديث  حديث حديث حديث حديث حديث  حديث حديث حديث حديث حديث  حديث حديث حديث حديث حديث ';
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 22),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: AppColors.kGreenColor,
      ),
      child: Text(
        hadith,
        style: Styles.textStyle18Godlen,
      ),
    );
  }
}
