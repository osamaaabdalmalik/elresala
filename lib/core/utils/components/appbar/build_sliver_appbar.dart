import 'package:elresala/core/constants/app_assets.dart';
import 'package:elresala/core/constants/app_colors.dart';
import 'package:elresala/core/styles/text_styles.dart';
import 'package:elresala/core/utils/components/appbar/direction_aware.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SliverAppBarWidget extends StatelessWidget {
  final bool? isSearch;
  final Color backgroundColor;
  final Color iconColor;
  final bool isPinned;
  final String title;
  final Function()? onTranslateIconTab;

  const SliverAppBarWidget({
    super.key,
    this.isSearch,
    this.backgroundColor = AppColors.kPrimaryColor,
    this.iconColor = AppColors.kWhiteColor,
    this.title = '',
    this.isPinned = false,
    this.onTranslateIconTab,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: backgroundColor,
      leading: !Navigator.canPop(context)
          ? null
          : DirectionAware(
              // من شان تدوير الايقونة بزاوية 90
              //DirectionAware for rotate the icon to other side rtl or ltr
              child: GestureDetector(
                onTap: () => Get.back(),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 25,
                  ),
                  child: SvgPicture.asset(
                    AppAssets.kBackIcon,
                    color: iconColor,
                  ),
                ),
              ),
            ),
      centerTitle: true,
      title: Text(
        title,
        style: Styles.textStyle18Godlen,
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
        onTranslateIconTab != null
            ? InkWell(
                onTap: onTranslateIconTab,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: SvgPicture.asset(
                    AppAssets.kTranslateIcon,
                  ),
                ),
              )
            : const SizedBox(),
      ],
      floating: true,
      snap: true,
      elevation: 0,
      pinned: isPinned,
    );
  }
}
