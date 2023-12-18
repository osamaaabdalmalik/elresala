import 'package:elresala/core/constants/app_colors.dart';
import 'package:elresala/features/main/domain/entities/home_card_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeCard extends StatelessWidget {
  final HomeCardData homeCardData;

  const HomeCard({super.key, required this.homeCardData});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(homeCardData.targetScreen),
      child: Container(
        height: Get.height * 0.1,
        decoration: const BoxDecoration(
          color: AppColors.kGreenColor,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    homeCardData.iconPath,
                    width: 35,
                  ),
                  const VerticalDivider(
                    color: AppColors.kWhiteColor,
                    indent: 5,
                    width: 15,
                    endIndent: 5,
                  ),
                  SizedBox(
                    width: Get.width * 0.5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          homeCardData.title,
                          style: const TextStyle(
                            color: AppColors.kGoldenColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          homeCardData.description,
                          style: const TextStyle(
                            color: AppColors.kWhiteColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                color: AppColors.kWhiteColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
