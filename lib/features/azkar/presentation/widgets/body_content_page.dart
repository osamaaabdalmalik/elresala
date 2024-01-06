import 'package:elresala/core/constants/app_assets.dart';
import 'package:elresala/core/constants/app_colors.dart';
import 'package:elresala/features/azkar/presentation/widgets/custom_copy_share_widget.dart';
import 'package:flutter/material.dart';

class BodyContentPage extends StatelessWidget {
  const BodyContentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const CircleAvatar(
            backgroundColor: AppColors.transparent,
            backgroundImage: AssetImage(AppAssets.kZaghrafaIcon),
            child: Text('1'),
          ),
          const SizedBox(height: 20),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColors.kGreenColor,
            ),
            child: const Text(
              '''قُلْ هُوَ ٱللَّهُ أَحَدٌ، ٱللَّهُ ٱلصَّمَدُ، لَمْ يَلِدْ وَلَمْ يُولَدْ
               ، وَلَمْ يَكُن لَّهُۥ كُفُوًا أَحَدٌۢ''',
              style: TextStyle(
                color: AppColors.kGoldenColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(height: 35),
          const CustomCopyShareWidget(),
          const SizedBox(height: 35),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColors.kGreenColor,
            ),
            child: const Text(
              '''Say: He is Allah, the One and Only; Allah, the Eternal, Absolute;
      He begetteth not, nor is He begotten; And there is none like unto Him''',
              style: TextStyle(
                color: AppColors.kGoldenColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(height: 35),
          const CustomCopyShareWidget(),
        ],
      ),
    );
  }
}
