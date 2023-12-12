import 'package:elresala/core/styles/text_styles.dart';
import 'package:elresala/features/quran/presentation/widgets/aya_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:elresala/core/constants/app_colors.dart';
import 'package:elresala/core/constants/app_assets.dart';
class AyaLanguageContainer extends StatelessWidget {
  const AyaLanguageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    String ayaEnglish =
        'Allahu Akbar Allahu Akbar Allahu Akbar Allahu Akbar Allahu Akbar Allahu Akbar Allahu Akbar Allahu Akbar Allahu Akbar Allahu Akbar Allahu Akbar Allahu Akbar Allahu Akbar Allahu Akbar Allahu Akbar Allahu Akbar ';
    int ayaNumber = 5;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 12),
          constraints:
              BoxConstraints(maxWidth: MediaQuery.sizeOf(context).width - 50),
          child: AyaText(
              aya: ayaEnglish,
              ayaStyle: Styles.textStyleAyaLanguage,
              ayaNumber: ayaNumber,
              textDirection: TextDirection.ltr,
              ayaNumberStyle: Styles.textStyleQuranPageNumber
                  .copyWith(color: AppColors.kGreenColor)),
        ),
        SvgPicture.asset(
         AppAssets.kCopyIcon ,
        ),
      ],
    );
  }
}
