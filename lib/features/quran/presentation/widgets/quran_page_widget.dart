import 'package:elresala/core/constants/app_colors.dart';
import 'package:elresala/core/styles/text_styles.dart';
import 'package:flutter/material.dart';

class QuranPageWidget extends StatelessWidget {
  final int number;

  const QuranPageWidget({required this.number, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        Container(
          width: 50,
          height: 26,
          decoration: const BoxDecoration(
            color: AppColors.kGoldenColor,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(90)),
          ),
          child: Center(
            child: Text(
              number.toString(),
              style: Styles.textStyleQuranPageNumber,
            ),
          ),
          // Add child widgets here if needed
        ),
      ],
    );
  }
}
