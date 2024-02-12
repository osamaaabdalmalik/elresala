import 'dart:ui';

import 'package:elresala/features/muslim/domain/usecases/get_courses_NewLife_use_case.dart';
import 'package:get/get.dart';
import 'package:elresala/core/constants/app_enums.dart';
import 'package:elresala/core/helpers/get_state_from_failure.dart';
import 'package:elresala/features/muslim/data/models/muslim_model_main.dart';

import 'package:logger/logger.dart';
import 'package:video_player/video_player.dart';

import '../../domain/usecases/get_courses_Arkan_use_case.dart';
import '../../domain/usecases/get_courses_Ayman_use_case.dart';
import '../../domain/usecases/get_courses_Moomlat_use_case.dart';
import '../../domain/usecases/get_courses_NewMuslim_use_case.dart';
import '../../domain/usecases/get_courses_Quran_use_case.dart';
import '../../domain/usecases/get_courses_Serah_use_case.dart';

class MuslimController extends GetxController {
// Vedio
  late VideoPlayerController videocontroller;
  String url = "https://www.youtube.com/watch?v=WazBqO1jzN8";
  int number = 0;
  int lisson_number = 0;
  late List<Map<String, dynamic>> namecourses;

  // Data
  List<MuslimModel> Quran = [];
  List<MuslimCoursesModel> Arkan = [];
  List<MuslimCoursesModel> Ayman = [];
  List<MuslimModel> NewMuslim = [];
  List<MuslimCoursesModel> Newlife = [];
  List<MuslimCoursesModel> Moomlat = [];
  List<MuslimCoursesModel> Serah = [];

  // States
  StateType getCoursesState = StateType.init;

  // Primitive
  String validationMessage = '';

  @override
  void onInit() async {
    Get.find<Logger>().i("Start onInit MuslimController");
    super.onInit();
    //Data from json
    await getCourseMoomlat();
    await getCourseSerah();
    await getCourseNewlife();
    await getCourseNewMuslim();
    await getCourseAyman();
    await getCourseQuran();
    await getCourseArkan();

    namecourses = await getListofNameCourse();
    getCoursesState = StateType.success;
    update();
    await playVedio(url);
    update();
    Get.find<Logger>().w("End onInit MuslimController");
  }

  Future<void> playVedio(String? url_vedio) async {
    Uri url = Uri(path: url_vedio);
    Get.find<Logger>().i("Start `getVideo from intrnet` in |MuslimController|");

    videocontroller = VideoPlayerController.networkUrl(url)
      ..addListener(() {
        update();
      })
      ..initialize().then((value) {
        videocontroller.play();
        videocontroller.setLooping(true);
      });
    Get.find<Logger>().i("End `getVideo from intrnet` in |MuslimController|");
    update();
  }

  Future<List<Map<String, dynamic>>> getListofNameCourse() async {
    getCoursesState = StateType.loading;
    update();
    return await [
      {"Arkan of islam": Arkan, "IsMuslimModel": false},
      {"Ayman": Ayman, "IsMuslimModel": false},
      {"moomlat": Moomlat, "IsMuslimModel": false},
      {"newlife": Newlife, "IsMuslimModel": false},
      {"newmuslim": NewMuslim, "IsMuslimModel": true},
      {"newmuslimsQuran": Quran, "IsMuslimModel": true},
      {"Serah": Serah, "IsMuslimModel": false},
    ];
  }

  Future<void> getCourseQuran() async {
    Get.find<Logger>().i("Start `getCourses` in |MuslimController|");
    getCoursesState = StateType.loading;
    update();
    GetCoursesQuranUseCase getCoursesUseCase =
        GetCoursesQuranUseCase(Get.find());
    var result = await getCoursesUseCase();
    result.fold(
      (l) async {
        getCoursesState = getStateFromFailure(l);
        validationMessage = l.message;
        update();
        await Future.delayed(const Duration(milliseconds: 50));
        getCoursesState = StateType.init;
      },
      (r) {
        getCoursesState = StateType.success;
        Quran = r;
        update();
      },
    );
    Get.find<Logger>()
        .w("End `getCourses` in |MuslimController| $getCoursesState");
  }

  Future<void> getCourseArkan() async {
    Get.find<Logger>().i("Start `getCourses Arkan` in |MuslimController|");
    getCoursesState = StateType.loading;
    update();
    GetCoursesArkanUseCase getCoursesUseCase =
        GetCoursesArkanUseCase(Get.find());
    var result = await getCoursesUseCase();
    result.fold(
      (l) async {
        getCoursesState = getStateFromFailure(l);
        validationMessage = l.message;
        update();
        await Future.delayed(const Duration(milliseconds: 50));
        getCoursesState = StateType.init;
      },
      (r) {
        getCoursesState = StateType.success;
        Arkan = r;
        Get.find<Logger>().i(
            "Start `getCourses Arkan` in |MuslimController| ${Arkan.length}");

        update();
      },
    );
    Get.find<Logger>()
        .w("End `getCourses Arkan` in |MuslimController| $getCoursesState");
  }

  Future<void> getCourseAyman() async {
    Get.find<Logger>().i("Start `getCourses Ayman` in |MuslimController|");
    getCoursesState = StateType.loading;
    update();
    GetCoursesAymanUseCase getCoursesUseCase =
        GetCoursesAymanUseCase(Get.find());
    var result = await getCoursesUseCase();
    result.fold(
      (l) async {
        getCoursesState = getStateFromFailure(l);
        validationMessage = l.message;
        update();
        await Future.delayed(const Duration(milliseconds: 50));
        getCoursesState = StateType.init;
      },
      (r) {
        getCoursesState = StateType.success;
        Ayman = r;
        update();
      },
    );
    Get.find<Logger>()
        .w("End `getCourses Ayman` in |MuslimController| $getCoursesState");
  }

  Future<void> getCourseNewMuslim() async {
    Get.find<Logger>().i("Start `getCourses NewMuslim` in |MuslimController|");
    getCoursesState = StateType.loading;
    update();
    GetCoursesNewMuslimUseCase getCoursesUseCase =
        GetCoursesNewMuslimUseCase(Get.find());
    var result = await getCoursesUseCase();
    result.fold(
      (l) async {
        getCoursesState = getStateFromFailure(l);
        validationMessage = l.message;
        update();
        await Future.delayed(const Duration(milliseconds: 50));
        getCoursesState = StateType.init;
      },
      (r) {
        getCoursesState = StateType.success;
        NewMuslim = r;
        update();
      },
    );
    Get.find<Logger>()
        .w("End `getCourses NewMuslim` in |MuslimController| $getCoursesState");
  }

  Future<void> getCourseNewlife() async {
    Get.find<Logger>().i("Start `getCourses Newlife` in |MuslimController|");
    getCoursesState = StateType.loading;
    update();
    GetCoursesNewLifeUseCase getCoursesUseCase =
        GetCoursesNewLifeUseCase(Get.find());
    var result = await getCoursesUseCase();
    result.fold(
      (l) async {
        getCoursesState = getStateFromFailure(l);
        validationMessage = l.message;
        update();
        await Future.delayed(const Duration(milliseconds: 50));
        getCoursesState = StateType.init;
      },
      (r) {
        getCoursesState = StateType.success;
        Newlife = r;
        update();
      },
    );
    Get.find<Logger>()
        .w("End `getCourses Newlife` in |MuslimController| $getCoursesState");
  }

  Future<void> getCourseSerah() async {
    Get.find<Logger>().i("Start `getCourses Serah` in |MuslimController|");
    getCoursesState = StateType.loading;
    update();
    GetCoursesSerahUseCase getCoursesUseCase =
        GetCoursesSerahUseCase(Get.find());
    var result = await getCoursesUseCase();
    result.fold(
      (l) async {
        getCoursesState = getStateFromFailure(l);
        validationMessage = l.message;
        update();
        await Future.delayed(const Duration(milliseconds: 50));
        getCoursesState = StateType.init;
      },
      (r) {
        getCoursesState = StateType.success;
        Serah = r;
        update();
      },
    );
    Get.find<Logger>()
        .w("End `getCourses Serah` in |MuslimController| $getCoursesState");
  }

  Future<void> getCourseMoomlat() async {
    Get.find<Logger>().i("Start `getCourses Moomlat` in |MuslimController|");
    getCoursesState = StateType.loading;
    update();
    GetCoursesMoomlatUseCase getCoursesUseCase =
        GetCoursesMoomlatUseCase(Get.find());
    var result = await getCoursesUseCase();
    result.fold(
      (l) async {
        getCoursesState = getStateFromFailure(l);
        validationMessage = l.message;
        update();
        await Future.delayed(const Duration(milliseconds: 50));
        getCoursesState = StateType.init;
      },
      (r) {
        getCoursesState = StateType.success;
        Moomlat = r;
        update();
      },
    );
    Get.find<Logger>()
        .w("End `getCourses Moomlat` in |MuslimController| $getCoursesState");
  }
}
