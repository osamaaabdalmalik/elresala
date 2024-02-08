// ignore_for_file: camel_case_types

import 'package:elresala/core/constants/app_colors.dart';
import 'package:elresala/core/styles/text_styles.dart';
import 'package:flutter/material.dart';


class Item_Card extends StatelessWidget {
  const Item_Card({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.kGreenColor,
      child: ListTile(
        leading: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: VerticalDivider(
            thickness: 2,
            color: AppColors.white,
          ),
        ),
        title: const Text(
          'AAAAA',
          style: Styles.textStyle18Godlen,
        ),
        subtitle: const Text(
          'BBBBB',
          style: TextStyle(color: Colors.white),
        ),
        trailing: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.info,
              color: AppColors.white,
            ),
            Container(
              width: 10,
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: AppColors.white,
            )
          ],
        ),
      ),
    );
  }
}
