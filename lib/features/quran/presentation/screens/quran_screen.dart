import 'package:elresala/features/quran/presentation/controller/quran_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuranScreen extends GetView<QuranController> {
  const QuranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Quran Screen",
        ),
      ),
      body: GetBuilder<QuranController>(
        builder: (controller) => ListView.builder(
          itemCount: controller.surahs.length,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          itemBuilder: (context, index) => ListTile(
            onTap: () {},
            title: Text(
              controller.surahs[index].name,
            ),
          ),
        ),
      ),
    );
  }
}
