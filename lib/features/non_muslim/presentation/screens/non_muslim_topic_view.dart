import 'package:elresala/core/constants/app_assets.dart';
import 'package:elresala/core/constants/app_colors.dart';
import 'package:elresala/core/utils/components/appbar/direction_aware.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class NonMuslimTopicView extends StatelessWidget {
  final String header;
  final String body;
  const NonMuslimTopicView(
      {super.key, required this.header, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      appBar: AppBar(
        leading: !Navigator.canPop(context)
            ? null
            : DirectionAware(
                // من شان تدوير الايقونة بزاوية 90
                //DirectionAware for rotate the icon to other side rtl or ltr
                child: GestureDetector(
                  onTap: Get.back,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 25),
                    child: SvgPicture.asset(
                      AppAssets.kBackIcon,
                      width: 10,
                      // color: iconColor,
                    ),
                  ),
                ),
              ),
        backgroundColor: AppColors.kPrimaryColor,
        title:
            Text(header, style: const TextStyle(color: AppColors.kGoldenColor)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
            child: SelectableText(
          body,
          style: const TextStyle(color: AppColors.kWhiteColor, fontSize: 17),
        )),
      ),
    );
  }
}
