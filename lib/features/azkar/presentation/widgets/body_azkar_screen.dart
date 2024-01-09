import 'package:elresala/core/constants/app_assets.dart';
import 'package:elresala/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';

import '../../../../core/constants/app_pages_routes.dart';

class BodyAzkarScreenPage extends StatelessWidget {
  const BodyAzkarScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(15),
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            onTap: () {
              Get.toNamed(AppPagesRoutes.contentAzkarScreen);
            },
            tileColor: AppColors.kGreenColor,
            splashColor: AppColors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Morning Souvenir'),
                IconButton(
                  icon: SvgPicture.asset(
                    index.isEven
                        ? AppAssets.kBookmarkIcon
                        : AppAssets.kBookmarkFillIcon,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            trailing: const Icon(Icons.arrow_forward_ios_outlined),
          ),
        );
      },
    );
  }
}
