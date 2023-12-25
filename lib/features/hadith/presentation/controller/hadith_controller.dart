import 'package:elresala/core/constants/app_enums.dart';
import 'package:elresala/core/helpers/get_state_from_failure.dart';
import 'package:elresala/features/hadith/domain/entities/hadith_entity.dart';
import 'package:elresala/features/hadith/domain/usecases/get_hadithes_use_case.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class HadithController extends GetxController {
  // Data
  List<Hadith> hadithes = [];

  // States
  StateType getHadithesState = StateType.init;

  // Primitive
  String validationMessage = '';

  @override
  void onInit() async {
    Get.find<Logger>().i("Start onInit HadithController");
    super.onInit();
    await getHadithes();
    Get.find<Logger>().w("End onInit HadithController");
  }

  Future<void> getHadithes() async {
    Get.find<Logger>().i("Start `getHadithes` in |HadithController|");
    getHadithesState = StateType.loading;
    update();
    GetHadithesUseCase getHadithesUseCase = GetHadithesUseCase(Get.find());
    var result = await getHadithesUseCase();
    result.fold(
      (l) async {
        getHadithesState = getStateFromFailure(l);
        validationMessage = l.message;
        update();
        await Future.delayed(const Duration(milliseconds: 50));
        getHadithesState = StateType.init;
      },
      (r) {
        getHadithesState = StateType.success;
        hadithes = r;
        update();
      },
    );
    Get.find<Logger>().w("End `getHadithes` in |HadithController| $getHadithesState");
  }
}
