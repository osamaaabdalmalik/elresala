import 'package:elresala/core/constants/app_enums.dart';
import 'package:elresala/core/helpers/get_state_from_failure.dart';
import 'package:elresala/features/quran/domain/entities/surah_entity.dart';
import 'package:elresala/features/quran/domain/usecases/get_surahs_use_case.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class QuranController extends GetxController {
  List<Surah> surahs = [];

  StateType getSurahsState = StateType.init;

  String validationMessage = '';

  @override
  void onInit() async {
    Get.find<Logger>().i("Start onInit QuranController");
    super.onInit();
    await getSurahs();
    Get.find<Logger>().f("End onInit QuranController");
  }

  Future<void> getSurahs() async {
    Get.find<Logger>().i("Start `getSurahs` in |QuranController|");
    getSurahsState = StateType.loading;
    update();
    GetSurahsUseCase getSurahsUseCase = GetSurahsUseCase(Get.find());
    var result = await getSurahsUseCase();
    result.fold(
      (l) async {
        getSurahsState = getStateFromFailure(l);
        validationMessage = l.message;
        update();
        await Future.delayed(const Duration(milliseconds: 50));
        getSurahsState = StateType.init;
      },
      (r) {
        getSurahsState = StateType.success;
        surahs = r;
        update();
      },
    );
    Get.find<Logger>().f("End `getSurahs` in |QuranController| $getSurahsState");
  }
}
