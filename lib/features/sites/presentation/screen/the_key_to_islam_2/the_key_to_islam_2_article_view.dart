import 'package:elresala/core/constants/app_colors.dart';
import 'package:elresala/features/sites/data/models/the_key_to_islam_2_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../widget/app_bar_custom.dart';

class TheKeyToIslam2ArticalView extends StatelessWidget {
  final TheKeyToIslam2 theKeyToIslam2;
  const TheKeyToIslam2ArticalView({super.key, required this.theKeyToIslam2});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarCustom(title: theKeyToIslam2.pageText.trim())
            .customAppBar(context),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              SelectableText(
                theKeyToIslam2.pageText,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontSize: 18,
                  height: 1.5,
                ),
              ),
              theKeyToIslam2.videos.isEmpty ||
                      theKeyToIslam2.videos.first.pageVideoTitle == 'title'
                  ? Container()
                  : const Center(
                      child: Text(
                        'videos',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.kGreenColor),
                      ),
                    ),
              theKeyToIslam2.videos.isEmpty ||
                      theKeyToIslam2.videos.first.pageVideoTitle == 'title'
                  ? Container()
                  : SizedBox(
                      height: 400,
                      child: ListView.builder(
                        itemCount: theKeyToIslam2.videos.length,
                        itemBuilder: (context, index) {
                          return Card(
                            color: AppColors.kGreenColor,
                            child: ListTile(
                              onTap: () async {
                                var url = Uri.parse(theKeyToIslam2
                                    .videos[index].pageVideoUrl
                                    .toString());
                                await launchUrl(url);
                              },
                              trailing: const Icon(
                                Icons.arrow_back_ios_new_rounded,
                                textDirection: TextDirection.rtl,
                                color: AppColors.amber,
                              ),
                              title: Text(
                                theKeyToIslam2.videos[index].pageVideoTitle,
                                style: const TextStyle(
                                    color: AppColors.kGoldenColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          );
                        },
                      ),
                    )
            ],
          ),
        ));
  }
}