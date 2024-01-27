import 'package:elresala/core/constants/app_assets.dart';
import 'package:elresala/core/constants/app_colors.dart';
import 'package:elresala/core/services/easy_loader_service.dart';
import 'package:elresala/core/styles/text_styles.dart';
import 'package:elresala/features/quran/presentation/controller/quran_controller.dart';
import 'package:elresala/features/quran/presentation/widgets/aya_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AyaLanguageContainer extends StatelessWidget {
  final String ayaNonArabic;
  final int ayaNumber;

  const AyaLanguageContainer({required this.ayaNonArabic, required this.ayaNumber, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 12),
            constraints: BoxConstraints(maxWidth: MediaQuery.sizeOf(context).width - 50),
            child: AyaText(
                aya: ayaNonArabic,
                ayaStyle: Styles.textStyle18Black,
                ayaNumber: ayaNumber,
                textDirection: TextDirection.ltr,
                ayaNumberStyle: Styles.textStyleQuranPageNumber.copyWith(color: AppColors.kGreenColor)),
          ),
          InkWell(
            onTap: () async {
              var c = Get.find<QuranController>();
              var data = ClipboardData(text: ayaNonArabic);
              await Clipboard.setData(data);
              EasyLoaderService.showToast(message: "Copied");
            },
            child: SvgPicture.asset(
              AppAssets.kCopyIcon,
            ),
          ),
        ],
      ),
    );
  }
}
