import 'package:elresala/features/quran/presentation/widgets/aya_arabic_container.dart';
import 'package:elresala/features/quran/presentation/widgets/aya_language_container.dart';
import 'package:elresala/features/quran/presentation/widgets/basmala_image.dart';
import 'package:elresala/features/quran/presentation/widgets/quran_page_widget.dart';
import 'package:flutter/material.dart';



class QuranViewSliver extends StatelessWidget {
  const QuranViewSliver({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: SingleChildScrollView(
        child: Column(
          children: [
            BasmalaImage(),
            SizedBox(height: 12),
            QuranPageWidget(),
            SizedBox(height: 12),
            AyaArabicContainer(),
            SizedBox(height: 12),
            AyaLanguageContainer(),
            SizedBox(height: 12),
            QuranPageWidget(),
            SizedBox(height: 12),
            AyaArabicContainer(),
            SizedBox(height: 12),
            AyaLanguageContainer(),
            SizedBox(height: 12),
            QuranPageWidget(),
            SizedBox(height: 12),
            AyaArabicContainer(),
            SizedBox(height: 12),
            AyaLanguageContainer(),
            SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
