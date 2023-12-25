import 'package:elresala/core/utils/components/appbar/direction_aware.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:elresala/core/constants/app_colors.dart';
import 'package:elresala/core/constants/app_assets.dart';

class SliverAppBarWidget extends StatelessWidget {
  const SliverAppBarWidget({
    super.key,
    this.isSearch,
    this.backgroundColor = AppColors.kPrimaryColor,
    this.iconColor = AppColors.kWhiteColor,
  });
  final bool? isSearch;
  final Color backgroundColor;
  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: backgroundColor,
      title: !Navigator.canPop(context)
          ? null
          : DirectionAware(
              // من شان تدوير الايقونة بزاوية 90
              //DirectionAware for rotate the icon to other side rtl or ltr
              child: GestureDetector(
                onTap: _navigatorBack,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: SvgPicture.asset(
                    AppAssets.kBackIcon,
                    color: iconColor,
                  ),
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

  _navigatorBack() {
    Get.back();
  }
}
