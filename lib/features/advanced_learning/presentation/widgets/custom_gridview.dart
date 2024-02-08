// ignore_for_file: camel_case_types

import 'package:elresala/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class Item_GridView extends StatelessWidget {
  const Item_GridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        // mainAxisSpacing: 8.0, // spacing between rows
        // crossAxisSpacing: 8.0, // spacing between columns
      ),
      padding: const EdgeInsets.all(8.0),
      itemCount: 4,
      itemBuilder: (context, index) {
        return const Column(
          children: [
            Text(
              'AAA',
              style: TextStyle(color: AppColors.kGoldenColor),
            ),
            SizedBox(width: 20, height: 10),
            Text(
              'BBBBB',
              style: TextStyle(color: AppColors.kGoldenColor),
            ),
          ],
        );
      },
    );
  }
}
