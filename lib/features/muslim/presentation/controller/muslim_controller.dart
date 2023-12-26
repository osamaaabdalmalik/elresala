import 'package:elresala/core/constants/app_enums.dart';
import 'package:elresala/core/helpers/get_state_from_failure.dart';
import 'package:elresala/features/hadith/domain/entities/hadith_entity.dart';
import 'package:elresala/features/muslim/domain/usecases/get_courses_use_case.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class MuslimController extends GetxController {
  // Data
  List<Hadith> hadithes = [];

  // States
  StateType getCoursesState = StateType.init;

  // Primitive
  String validationMessage = '';

  @override
  void onInit() async {
    Get.find<Logger>().i("Start onInit MuslimController");
    super.onInit();
    await getCourses();
    Get.find<Logger>().w("End onInit MuslimController");
  }

  Future<void> getCourses() async {
    Get.find<Logger>().i("Start `getCourses` in |MuslimController|");
    getCoursesState = StateType.loading;
    update();
    GetCoursesUseCase getCoursesUseCase = GetCoursesUseCase(Get.find());
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
        hadithes = r;
        update();
      },
    );
    Get.find<Logger>().w("End `getCourses` in |MuslimController| $getCoursesState");
  }
}
