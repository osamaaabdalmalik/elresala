import 'package:elresala/core/constants/app_colors.dart';
import 'package:elresala/core/styles/text_styles.dart';
import 'package:flutter/material.dart';

class TimeAndHourWidget extends StatelessWidget {
  const TimeAndHourWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          '20 RAGB 1445H ',
          style: Styles.textStyle18Golden,
        ),
        const Text(
          '04:55',
          style: Styles.textStyle48Golden,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              ' Fajr ',
              style: Styles.textStyle18Golden.copyWith(color: AppColors.danger),
            ),
            const Text(
              ' 1:12:44 ',
              style: Styles.textStyle18Golden,
            ),
            const Text(
              ' Left ',
              style: Styles.textStyle18Golden,
            ),
          ],
        )
      ],
    );
  }
}
