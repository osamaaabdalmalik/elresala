import 'package:elresala/core/styles/text_styles.dart';
import 'package:elresala/features/quran/presentation/widgets/aya_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:elresala/core/constants/app_colors.dart';
import 'package:elresala/core/constants/app_assets.dart';

class AyaLanguageContainer extends StatelessWidget {
  final String ayaNonArabic;
  final int ayaNumber;
  const AyaLanguageContainer({required this.ayaNonArabic,required this.ayaNumber,super.key});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 12),
            constraints:
                BoxConstraints(maxWidth: MediaQuery.sizeOf(context).width - 50),
            child: AyaText(
                aya: ayaNonArabic,
                ayaStyle: Styles.textStyle18Black,
                ayaNumber: ayaNumber,
                textDirection: TextDirection.ltr,
                ayaNumberStyle: Styles.textStyleQuranPageNumber
                    .copyWith(color: AppColors.kGreenColor)),
          ),
          SvgPicture.asset(
            AppAssets.kCopyIcon,
          ),
        ],
      ),
    );
  }
}
