import 'package:elresala/core/utils/components/appbar/build_sliver_appbar.dart';
import 'package:elresala/features/quran/presentation/controller/quran_controller.dart';
import 'package:elresala/features/quran/presentation/widgets/soura_select_sliver_context.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuranScreen extends GetView<QuranController> {
  const QuranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBarWidget(title: "Quran"),
          SurahSelectSliver(surahs: controller.surahs),
        ],
      ),
    );
  }
}
