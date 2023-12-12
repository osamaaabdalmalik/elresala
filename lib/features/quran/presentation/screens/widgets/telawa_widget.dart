import 'package:elresala/features/quran/presentation/screens/soura_select_view.dart';
import 'package:elresala/features/quran/presentation/screens/telawa_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:elresala/core/constants/app_colors.dart';
import 'package:elresala/core/constants/app_assets.dart';

class TelawaWidget extends StatelessWidget {
  const TelawaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height * .18,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
          color: AppColors.kGreenColor),
      child: SizedBox(
        width: size.width,
        height: size.height * .15,
        child: Column(children: [
          Row(
            children: [
              GestureDetector(
                  onTap: _navigateToTelawaScreen,
                  child: const Text('El Sudis')),
              const SizedBox(
                width: 8,
              ),
              GestureDetector(
                  onTap: _navigateToTelawaScreen,
                  child: Image.asset(AppAssets.kSoudisIcon)),
              const SizedBox(
                width: 12,
              ),
              GestureDetector(
                  onTap: _navigateToSuoraSelect,
                  child: SvgPicture.asset(AppAssets.kVectorUpIcon)),
              const Spacer(),
              SvgPicture.asset(
               AppAssets. kCopyIcon,
                color: AppColors.kPrimaryColor,
              ),
              const SizedBox(
                width: 8,
              ),
              SvgPicture.asset(AppAssets.kTranslateIcon),
              const SizedBox(
                width: 8,
              ),
              SvgPicture.asset(AppAssets.kEyeViewFillIcon),
              const SizedBox(
                width: 8,
              ),
              SvgPicture.asset(AppAssets.kShareIcon),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Spacer(),
              SvgPicture.asset(AppAssets.kPauseIcon),
              SvgPicture.asset(AppAssets.kPreviosPlayIcon),
              const Spacer(),
              SvgPicture.asset(AppAssets.kPlayIcon),
              const Spacer(),
              SvgPicture.asset(AppAssets.kStepPalyIcon),
              SvgPicture.asset(AppAssets.kPauseIcon),
              const Spacer(),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.centerLeft,
                children: [
                  SvgPicture.asset(AppAssets.kLineIcon),
                  SvgPicture.asset(AppAssets.kEllipseBallProgress),
                ],
              )
            ],
          ),
        ]),
      ),
    );
  }

  void _navigateToSuoraSelect() {
    Get.to(const SuoraSelectView());
  }

  void _navigateToTelawaScreen() {
    Get.to(const TelawaScreen());
  }
}
