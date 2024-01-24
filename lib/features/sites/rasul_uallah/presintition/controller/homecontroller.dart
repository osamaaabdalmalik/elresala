import 'package:elresala/features/sites/data/get_site_data.dart';
import 'package:elresala/features/sites/rasul_uallah/presintition/screen/Artical/articalscreen.dart';
import 'package:elresala/features/sites/rasul_uallah/presintition/screen/Audio/audioscreen.dart';
import 'package:elresala/features/sites/rasul_uallah/presintition/screen/Book/bookscreen.dart';
import 'package:elresala/features/sites/rasul_uallah/presintition/screen/Video/videoscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {
  getHomeData();
}

class HomeControllerImp extends HomeController {
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
    Map response = await HomeData()
        .getData("assets/rasulu_allah.json", "RasuluAllah");
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
