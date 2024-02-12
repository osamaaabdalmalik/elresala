import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class CustomMuslimContianer extends StatelessWidget {
  final String text;

  const CustomMuslimContianer({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.kGreenColor,
          borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 7),
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 4,
            child: Text(
              maxLines: 3,
              text,
              style:
                  const TextStyle(color: AppColors.kGoldenColor, fontSize: 16),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                const Text("sdfd"),
                Icon(
                  size: 34,
                  Icons.chevron_right,
                  color: AppColors.kPrimaryColor,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
