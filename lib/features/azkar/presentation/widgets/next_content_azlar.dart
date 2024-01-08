import 'package:elresala/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NextContentAzkar extends StatelessWidget {
  const NextContentAzkar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: context.height * 0.05,
          width: context.width,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: AppColors.kGoldenColor,
            borderRadius: BorderRadius.circular(25),
          ),
          alignment: Alignment.center,
          child: const Text('1/5'),
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.arrow_back_ios,
              color: AppColors.kGoldenColor,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Next  ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: AppColors.kGoldenColor,
            ),
          ],
        ),
      ],
    );
  }
}
