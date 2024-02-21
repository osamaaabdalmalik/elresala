import 'dart:ffi';
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
bool isFullScreen=false;
  // Variables to get Data From json
  int course_number = 0;
  int artical_number=0;
  int lisson_number = 0;


//  Data courses
  List DataViewList = [];
  bool isMoslimModel = true;
  List<String> muslimcoursesname = [
    "Arkan of islam",
    "Ayman",
    "moomlat",
    "newlife",
    "newmuslim",
    "newmuslimsQuran",
    "Serah"
  ];



  // States
  StateType getCoursesState = StateType.init;

  // Primitive
  String validationMessage = '';


  // GetData from Data_Layer to presentation_Layer

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
        DataViewList = r;
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
        DataViewList = r;
        Get.find<Logger>().i(
            "Start `getCourses Arkan` in |MuslimController| ");

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
        DataViewList = r;
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
        DataViewList = r;
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
        DataViewList = r;
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
        DataViewList = r;
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
        DataViewList = r;
        update();
      },
    );
    Get.find<Logger>()
        .w("End `getCourses Moomlat` in |MuslimController| $getCoursesState");
  }

  //put Data in  ListDataView controller

  getDatafromjson(int number) async {
    switch (number) {
      case 0:
        {
          setAllDataView(getCourseArkan(), false);
        }
        break;
      case 1:
        {
          setAllDataView(getCourseAyman(),  false);
        }
        break;
      case 2:
        {
          setAllDataView(getCourseMoomlat(),  false);
        }
        break;
      case 3:
        {
          setAllDataView(getCourseNewlife(), false);
        }
        break;
      case 4:
        {
          setAllDataView(getCourseNewMuslim(), true);
        }
        break;
      case 5:
        {
          setAllDataView(getCourseQuran(),  true);
        }
        break;
      case 6:
        {
          setAllDataView(getCourseSerah(),  false);
        }
        break;
    }
  }

  //put Data in ScreenMuslim

  setAllDataView(Future<void> function, bool typeModel) async {

    await function;
    isMoslimModel = typeModel;


  }




  
}
