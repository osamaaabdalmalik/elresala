import 'package:elresala/core/constants/app_colors.dart';
import 'package:elresala/features/sites/presentation/controller/rasul_uallah/audiocontroller.dart';
import 'package:elresala/features/sites/presentation/widget/inkwell_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class AudioContainPage extends StatelessWidget {
  final int itemCount;
  final List dataText;
  final List onTap;
  const AudioContainPage(
      {super.key,
      required this.itemCount,
      required this.dataText,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    Get.put(AudioControllerImp());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.kPrimaryColor,
        ),
        body: GetBuilder<AudioControllerImp>(
            builder: ((controller) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: ListView.builder(
                    padding: const EdgeInsets.all(5),
                    itemCount: itemCount,
                    itemBuilder: (context, index) {
                      return InkwellCustom(
                        catigory: false,
                        dataText: dataText[index],
                        onTap: () async {
                          await launchUrl(Uri.parse(onTap[index]));
                        },
                      );
                    })))));
  }
}
