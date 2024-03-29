import 'package:elresala/features/quran/domain/entities/ayah_entity.dart';
import 'package:elresala/features/quran/presentation/controller/quran_controller.dart';
import 'package:elresala/features/quran/presentation/widgets/aya_arabic_container.dart';
import 'package:elresala/features/quran/presentation/widgets/aya_language_container.dart';
import 'package:elresala/features/quran/presentation/widgets/quran_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AyaContainer extends StatelessWidget {
  final Ayah ayah;
  final int number;

  const AyaContainer({required this.number, required this.ayah, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        QuranPageWidget(number: number, ayah: ayah),
        const SizedBox(height: 12),
        AyaArabicContainer(ayaArabic: ayah.arabic, ayaNumber: number),
        const SizedBox(height: 12),
        GetBuilder<QuranController>(
          id: "ayaNonArabic",
          builder: (controller) => AyaLanguageContainer(
            ayaNonArabic: controller.selectedTranslator == 1
                ? ayah.julioCortes
                : controller.selectedTranslator == 2
                    ? ayah.raulGonzalezBornez
                    : ayah.muhammadIsaGarcia,
            ayaNumber: number,
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
