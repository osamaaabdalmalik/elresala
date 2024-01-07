import 'package:elresala/core/constants/app_colors.dart';
import 'package:elresala/core/styles/text_styles.dart';
import 'package:elresala/core/utils/components/appbar/build_sliver_appbar.dart';
import 'package:elresala/features/hadith/presentation/widgets/hadith_item.dart';
import 'package:elresala/features/hadith/presentation/widgets/hadith_number_widget.dart';
import 'package:elresala/features/hadith/presentation/widgets/hadith_section_name.dart';
import 'package:elresala/features/hadith/presentation/widgets/hadith_settings_icons_row_widget.dart';
import 'package:flutter/material.dart';

class HadithBookScreen extends StatelessWidget {
  const HadithBookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBarWidget(
            isSearch: false,
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                HadithSectionName(
                  hadithBookName: 'Sahih Muslim',
                ),
                HadithNumberWidget(),
                HadithItemWidget(),
                SizedBox(
                  height: 10,
                ),
                HadithSettingsIconsRowWidget(),
                SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HadithDetailsText(infoText: 'حديث', detailsText: "مسلم"),
                    HadithDetailsText(infoText: 'رواية', detailsText: "مسلم"),
                    HadithDetailsText(infoText: 'اسناد', detailsText: "مسلم"),
                    HadithDetailsText(infoText: 'الصحة', detailsText: "مسلم"),
                    HadithDetailsText(
                        infoText: 'معومات',
                        detailsText:
                            " مسلم  مسلم  مسلم  مسلم  مسلم  مسلم  مسلم  مسلم  مسلم  مسلم  مسلم  مسلم  مسلم "),
                    HadithDetailsText(
                        infoText: 'المتكلم',
                        detailsText:
                            " مسلم  مسلم  مسلم  مسلم  مسلم  مسلم  مسلم  مسلم  مسلم  مسلم  مسلم  مسلم  مسلم  مسلم  مسلم  مسلم "),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HadithDetailsText extends StatelessWidget {
  const HadithDetailsText({
    super.key,
    this.textDirection,
    required this.infoText,
    required this.detailsText,
  });

  final TextDirection? textDirection;
  final String infoText;
  final String detailsText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: RichText(
        textAlign: TextAlign.start,
        textDirection: textDirection,
        text: TextSpan(
          style: Styles.textStyle18Golden,
          children: [
            TextSpan(text: '$infoText : '),
            TextSpan(text: ' $detailsText ', style: Styles.textStyle18White),
          ],
        ),
      ),
    );
  }
}
