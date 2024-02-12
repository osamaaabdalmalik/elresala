
import 'package:flutter/cupertino.dart';

import '../../../../core/constants/app_colors.dart';

class CustomTextMuslim extends StatelessWidget {
  final String text;
  final bool istitle;
  const CustomTextMuslim({super.key, required this.text, required this.istitle});

  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(
        color: AppColors.kGoldenColor,
        fontSize: istitle?25:15,
        fontStyle:istitle? FontStyle.italic:null,
        fontWeight: istitle?FontWeight.bold:null),
    );
  }
}
