import 'package:elresala/features/sites/presentation/controller/rasul_uallah/audiocontroller.dart';
import 'package:elresala/features/sites/presentation/screen/rasul_uallah/Audio/audiocontain.dart';
import 'package:elresala/features/sites/presentation/widget/appbar.dart';
import 'package:elresala/features/sites/presentation/widget/inkwell_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AudioScreen extends StatelessWidget {
  const AudioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AudioControllerImp());
    return Scaffold(
        appBar: const AppBarCustom(title: 'Audio').customAppBar(context),
        body: GetBuilder<AudioControllerImp>(
            builder: (controller) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: GridView.builder(
                    padding: const EdgeInsets.all(5),
                    itemCount: controller.dataAudioKey.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1, childAspectRatio: 3),
                    itemBuilder: (context, index) {
                      return InkwellCustom(
                        catigory: false,
                        dataText: controller.dataAudioKey[index],
                        onTap: () {
                          Get.to(AudioContainPage(
                              dataText: controller.dataAudioTitle[index],
                              itemCount:
                                  controller.dataAudioTitle[index].length,
                              onTap: controller.dataAudioLink[index]));
                        },
                      );
                    }))));
  }
}
