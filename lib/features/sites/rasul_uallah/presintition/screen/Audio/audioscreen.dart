import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elresala/features/sites/rasul_uallah/presintition/controller/audiocontroller.dart';
import 'package:elresala/features/sites/rasul_uallah/presintition/screen/Audio/audiocontain.dart';
import 'package:elresala/features/sites/widget/inkwell_custom.dart';

class AudioScreen extends StatelessWidget {
  const AudioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AudioControllerImp());
    return Scaffold(
        appBar: AppBar(),
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
                              itemCount: controller.dataAudioTitle[index].length,
                              onTap: controller.dataAudioLink[index]));
                        },
                      );
                    }))));
  }
}
