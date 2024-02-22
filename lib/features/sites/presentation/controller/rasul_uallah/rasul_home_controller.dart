import 'package:elresala/core/constants/app_keys.dart';
import 'package:elresala/features/sites/data/get_site_data.dart';
import 'package:elresala/features/sites/presentation/screen/rasul_uallah/Artical/artical_screen.dart';
import 'package:elresala/features/sites/presentation/screen/rasul_uallah/Audio/audio_screen.dart';
import 'package:elresala/features/sites/presentation/screen/rasul_uallah/Book/book_screen.dart';
import 'package:elresala/features/sites/presentation/screen/rasul_uallah/Video/video_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class RasulHomeController extends GetxController {
  getHomeData();
}

class RasulHomeControllerImp extends RasulHomeController {
  List data = [];

  List<IconData> icons = [
    Icons.headphones_outlined,
    Icons.tv_outlined,
    Icons.book_outlined,
    Icons.article_sharp
  ];

  List<Widget> page = [
    const AudioScreen(),
    const VideoScreen(),
    const BookScreen(),
    const ArticalScreen(),
  ];

  @override
  getHomeData() async {
    Map response = await HomeData().getData(AppKeys.rasuluAllah, "RasuluAllah");
    data.clear();
    data.addAll(response.keys);
    update();
  }

  @override
  void onInit() {
    getHomeData();
    super.onInit();
  }
}
