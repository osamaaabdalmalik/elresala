// لما أستخدم المودل دا ببيظهرلي List<dynamic> is not subtype of Map<String,dynamic> لذلك إستغنيت عنه
// class TelegramChannelsModel {
//   TelegramChannels telegramChannels;
//   IslamHousePhotos islamHousePhotos;
 
//   TelegramChannelsModel(
//       {required this.telegramChannels, required this.islamHousePhotos});

//   factory TelegramChannelsModel.fromJson(Map<String, dynamic> json) {
//     return TelegramChannelsModel(
//       telegramChannels: TelegramChannels.fromJson(json['telegram-channels']),
//       islamHousePhotos: IslamHousePhotos.fromJson(json['sp-islamhouse-photos']),
//     );
//   }
// }

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
