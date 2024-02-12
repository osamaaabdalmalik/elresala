import 'package:flutter/cupertino.dart';

import '../../../../core/constants/app_colors.dart';

class CustomMuslimButtonTitle extends StatelessWidget {
  final String title;
   CustomMuslimButtonTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return  Text(
      title,
      style: const TextStyle(
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold,
          color: AppColors.kGoldenColor,
          fontSize: 28),
    );
  }
}
