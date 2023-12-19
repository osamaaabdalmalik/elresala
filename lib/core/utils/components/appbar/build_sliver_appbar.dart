import 'package:elresala/core/constants/app_assets.dart';
import 'package:elresala/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SliverAppBarWidget extends StatelessWidget {
  final bool? isSearch;
  final Color backgroundColor;
  final Color iconColor;

  const SliverAppBarWidget({
    super.key,
    this.isSearch,
    this.backgroundColor = AppColors.kPrimaryColor,
    this.iconColor = AppColors.kWhiteColor,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: backgroundColor,
      title: GestureDetector(
        onTap: () => Get.back(),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SvgPicture.asset(
            AppAssets.kBackIcon,
            color: iconColor,
          ),
        ),
      ),
      actions: [
        isSearch == true
            ? Padding(
                padding: const EdgeInsets.only(right: 20),
                child: SvgPicture.asset(
                  AppAssets.kSearchIcon,
                  color: iconColor,
                ),
              )
            : const SizedBox(),
      ],
      floating: true,
      snap: true,
      elevation: 0,
    );
  }
}
