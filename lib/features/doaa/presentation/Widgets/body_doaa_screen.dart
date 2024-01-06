import 'package:elresala/core/constants/app_assets.dart';
import 'package:elresala/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BodyDoaaScreen extends StatelessWidget {
  const BodyDoaaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(15),
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            onTap: () {},
            tileColor: AppColors.kGreenColor,
            splashColor: AppColors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Praying for oblivion'),
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
