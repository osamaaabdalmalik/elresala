import 'package:elresala/core/constants/app_colors.dart';
import 'package:elresala/core/styles/text_styles.dart';
import 'package:elresala/core/utils/components/appbar/build_sliver_appbar.dart';
import 'package:elresala/features/hadith/presentation/controller/hadith_controller.dart';
import 'package:elresala/features/hadith/presentation/screens/hadith_book_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HadithScreen extends GetView<HadithController> {
  const HadithScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      body: CustomScrollView(
        slivers: [
          const SliverAppBarWidget(
            isSearch: false,
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Hadith',
                      style: Styles.textStyle18Golden,
                    ),
                  ),
                  HadithSectionWidget(
                    hadithBookName: 'Sahih Muslim',
                    onTap: navigateToHadith,
                  ),
                  HadithSectionWidget(
                    hadithBookName: 'Sahih Al Bukhari',
                    onTap: navigateToHadith,
                  ),
                  HadithSectionWidget(
                    hadithBookName: 'Abu Dawood',
                    onTap: navigateToHadith,
                  ),
                  HadithSectionWidget(
                    hadithBookName: 'Sahih Muslim',
                    onTap: navigateToHadith,
                  ),
                  HadithSectionWidget(
                    hadithBookName: 'Sahih Al Bukhari',
                    onTap: navigateToHadith,
                  ),
                  HadithSectionWidget(
                    hadithBookName: 'Abu Dawood',
                    onTap: navigateToHadith,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void navigateToHadith() {
    Get.to(const HadithBookScreen());
  }
}

class HadithSectionWidget extends StatelessWidget {
  const HadithSectionWidget({
    super.key,
    required this.hadithBookName,
    required this.onTap,
  });

  final String hadithBookName;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * .8,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
          margin: const EdgeInsets.only(top: 50),
          decoration: BoxDecoration(
            color: AppColors.kGreenColor,
            borderRadius: BorderRadius.circular(22),
          ),
          child: Center(
            child: Text(
              hadithBookName,
              style: Styles.textStyle18Golden,
            ),
          ),
        ),
      ),
    );
  }
}
