import 'package:elresala/core/constants/app_enums.dart';
import 'package:elresala/core/helpers/get_state_from_failure.dart';
import 'package:elresala/features/doaa/domain/usecases/get_doaas_use_case.dart';
import 'package:elresala/features/hadith/domain/entities/hadith_entity.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class DoaaController extends GetxController {
  // Data
  List<Hadith> hadithes = [];

  // States
  StateType getDoaasState = StateType.init;

  // Primitive
  String validationMessage = '';

  @override
  void onInit() async {
    Get.find<Logger>().i("Start onInit DoaaController");
    super.onInit();
    // await getDoaas();
    Get.find<Logger>().w("End onInit DoaaController");
  }

  Future<void> getDoaas() async {
    Get.find<Logger>().i("Start `getDoaas` in |DoaaController|");
    getDoaasState = StateType.loading;
    update();
    GetDoaasUseCase getDoaasUseCase = GetDoaasUseCase(Get.find());
    var result = await getDoaasUseCase();
    result.fold(
      (l) async {
        getDoaasState = getStateFromFailure(l);
        validationMessage = l.message;
        update();
        await Future.delayed(const Duration(milliseconds: 50));
        getDoaasState = StateType.init;
      },
      (r) {
        getDoaasState = StateType.success;
        hadithes = r;
        update();
      },
    );
    Get.find<Logger>().w("End `getDoaas` in |DoaaController| $getDoaasState");
  }
}
