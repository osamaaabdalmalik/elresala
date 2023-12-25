import 'package:elresala/core/constants/app_enums.dart';
import 'package:elresala/core/helpers/get_state_from_failure.dart';
import 'package:elresala/features/azkar/domain/usecases/get_azkars_use_case.dart';
import 'package:elresala/features/hadith/domain/entities/hadith_entity.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class AzkarController extends GetxController {
  // Data
  List<Hadith> hadithes = [];

  // States
  StateType getAzkarsState = StateType.init;

  // Primitive
  String validationMessage = '';

  @override
  void onInit() async {
    Get.find<Logger>().i("Start onInit AzkarController");
    super.onInit();
    // await getAzkars();
    Get.find<Logger>().w("End onInit AzkarController");
  }

  Future<void> getAzkars() async {
    Get.find<Logger>().i("Start `getAzkars` in |AzkarController|");
    getAzkarsState = StateType.loading;
    update();
    GetAzkarsUseCase getAzkarsUseCase = GetAzkarsUseCase(Get.find());
    var result = await getAzkarsUseCase();
    result.fold(
      (l) async {
        getAzkarsState = getStateFromFailure(l);
        validationMessage = l.message;
        update();
        await Future.delayed(const Duration(milliseconds: 50));
        getAzkarsState = StateType.init;
      },
      (r) {
        getAzkarsState = StateType.success;
        hadithes = r;
        update();
      },
    );
    Get.find<Logger>().w("End `getAzkars` in |AzkarController| $getAzkarsState");
  }
}
