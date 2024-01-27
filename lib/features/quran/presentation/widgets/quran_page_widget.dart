import 'package:elresala/core/constants/app_assets.dart';
import 'package:elresala/core/constants/app_colors.dart';
import 'package:elresala/core/services/easy_loader_service.dart';
import 'package:elresala/core/styles/text_styles.dart';
import 'package:elresala/features/quran/domain/entities/ayah_entity.dart';
import 'package:elresala/features/quran/presentation/controller/quran_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class QuranPageWidget extends StatelessWidget {
  final int number;
  final Ayah ayah;

  const QuranPageWidget({
    required this.number,
    required this.ayah,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 50,
          height: 26,
          decoration: const BoxDecoration(
            color: AppColors.kGoldenColor,
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(90)),
          ),
          child: Center(
            child: Text(
              number.toString(),
              style: Styles.textStyleQuranPageNumber,
            ),
          ),
          // Add child widgets here if needed
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: InkWell(
            onTap: () async {
              var c = Get.find<QuranController>();
              var data = ClipboardData(
                  text:
                      "${ayah.arabic}\n\n${c.selectedTranslator == 1 ? ayah.julioCortes : c.selectedTranslator == 2 ? ayah.raulGonzalezBornez : ayah.muhammadIsaGarcia}");
              await Clipboard.setData(data);
              EasyLoaderService.showToast(message: "Copied");
            },
            child: SvgPicture.asset(
              AppAssets.kCopyIcon,
            ),
          ),
        ),
      ],
    );
  }
}
