import 'package:elresala/core/constants/app_enums.dart';
import 'package:elresala/core/helpers/get_state_from_failure.dart';
import 'package:elresala/features/telegram_channels/data/models/telegram_channels_model.dart';
import 'package:elresala/features/telegram_channels/domain/usecases/get_telegram_channels_usecases.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class TelegramChannelsController extends GetxController {
  // Data
  TelegramChannels? channelsModel;
  List channelsNames = [];
  List<TelegramChannel> channelMessagesList = [];
  // States
  StateType getTelegramChannelsState = StateType.init;
  // Primitive
  String validationMessage = '';

  @override
  void onInit() async {
    Get.find<Logger>().i("Start onInit TelebgramChannelsController");
    super.onInit();
    await getTelegramChannels();
    Get.find<Logger>().w("End onInit TelegramChannelsController");
  }

  Future<void> getTelegramChannels() async {
    Get.find<Logger>()
        .i("Start `getTelegramChannels` in |TelegramChannelsController|");
    getTelegramChannelsState = StateType.loading;
    update();
    GetTelegramChannelsUseCase getTelegramChannelsUseCase =
        GetTelegramChannelsUseCase(Get.find());
    var result = await getTelegramChannelsUseCase();
    result.fold(
      (l) async {
        getTelegramChannelsState = getStateFromFailure(l);
        validationMessage = l.message;
        update();
        await Future.delayed(const Duration(milliseconds: 50));
        getTelegramChannelsState = StateType.init;
      },
      (r) {
        getTelegramChannelsState = StateType.success;
        channelsModel = r;
        channelsModel?.telegramChannels.forEach((channelName, channelMessages) {
          channelsNames.add(channelName);
          channelMessagesList.add(channelMessages);
        });
        update();
      },
    );
    Get.find<Logger>().w(
        "End `getTelegramChannels` in |TelegramChannelsController| $getTelegramChannelsState");
  }
}
