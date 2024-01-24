import 'package:flutter/material.dart';
import 'package:elresala/core/constants/app_colors.dart';

class ArticalCustom extends StatelessWidget {
  final String dataText;
  const ArticalCustom({super.key, required this.dataText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.kGreenColor,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
        child: ListView(children: [
          SelectableText(
            dataText,
            textAlign: TextAlign.start,
            style: const TextStyle(
                fontSize: 18, height: 1.5, fontWeight: FontWeight.bold),
          ),
        ]),
      ),
    );
  }
}
