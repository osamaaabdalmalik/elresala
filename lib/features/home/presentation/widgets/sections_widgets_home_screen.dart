import 'package:elresala/core/constants/app_assets.dart';
import 'package:elresala/core/constants/app_colors.dart';
import 'package:elresala/features/home/presentation/widgets/section_item_homeP_page_widget.dart';
import 'package:flutter/material.dart';
class SectionswidgetsHomeScreen extends StatelessWidget {
  const SectionswidgetsHomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.kWhiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: const Column(children: [
        SizedBox(
          height: 40,
        ),
        SectionItemHomePageWidget(
            sectionIcon: AppAssets.quranIcon,
            sectionName: 'Quran',
            sectionSubtitle: 'Learn , Read all the Quran'),
        SectionItemHomePageWidget(
            sectionIcon: AppAssets.hadithIcon,
            sectionName: 'hadith',
            sectionSubtitle: ''),
        SectionItemHomePageWidget(
          sectionIcon: AppAssets.prayIcon,
          sectionName: 'pray',
          sectionSubtitle: 'Learn how to pray,Qiblah',
        ),
        SectionItemHomePageWidget(
            sectionIcon: AppAssets.azkarIcon,
            sectionName: 'azkar',
            sectionSubtitle: ''),
        SectionItemHomePageWidget(
            sectionIcon: AppAssets.calenderIcon,
            sectionName: 'calender',
            sectionSubtitle: ''),
        SectionItemHomePageWidget(
            sectionIcon: AppAssets.duaIcon,
            sectionName: 'calender',
            sectionSubtitle:
                'Data,All holidays and special occasions for Muslims'),
      ]),
    );
  }
}

