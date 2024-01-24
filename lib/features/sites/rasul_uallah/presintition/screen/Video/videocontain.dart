import 'package:elresala/features/sites/rasul_uallah/presintition/controller/videocontroller.dart';
import 'package:elresala/features/sites/widget/inkwell_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class VideoContainPage extends StatelessWidget {
  final int itemCount;
  final List dataText;
  final List onTap;
  const VideoContainPage(
      {super.key,
      required this.itemCount,
      required this.dataText,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    Get.put(VideoControllerImp());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[300],
          elevation: 0.1,
        ),
        body: GetBuilder<VideoControllerImp>(
            builder: ((controller) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: GridView.builder(
                    padding: const EdgeInsets.all(5),
                    itemCount: itemCount,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1, childAspectRatio: 3),
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
