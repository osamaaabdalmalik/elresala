import 'package:elresala/core/constants/app_assets.dart';
import 'package:elresala/core/constants/app_colors.dart';
import 'package:elresala/core/styles/text_styles.dart';
import 'package:elresala/core/utils/components/appbar/direction_aware.dart';
import 'package:elresala/features/telegram_channels/presentation/controller/telegram_channels_controller.dart';
import 'package:elresala/features/telegram_channels/presentation/widgets/telegram_messages_search_delegate.dart';
import 'package:flutter/material.dart';
import 'package:elresala/features/telegram_channels/data/models/telegram_channels_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class TelegramChannelsMessagesScreen
    extends GetView<TelegramChannelsController> {
  final TelegramChannel channelMessages;
  final String channelName;
  const TelegramChannelsMessagesScreen({
    super.key,
    required this.channelMessages,
    required this.channelName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      appBar: AppBar(
        title: Row(
          children: [
            const CircleAvatar(),
            const SizedBox(),
            Text(
              channelName,
              style: Styles.textStyle20Golden,
            ),
          ],
        ),
        elevation: 0,
        leading: !Navigator.canPop(context)
            ? null
            : DirectionAware(
                // من شان تدوير الايقونة بزاوية 90
                //DirectionAware for rotate the icon to other side rtl or ltr
                child: GestureDetector(
                  onTap: () => Get.back(),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 25,
                    ),
                    child: SvgPicture.asset(
                      AppAssets.kBackIcon,
                      color: AppColors.gray,
                    ),
                  ),
                ),
              ),
        backgroundColor: AppColors.kPrimaryColor,
        actions: [
          IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: TelegramMessagesSearcDelegate(
                      channelMessages:
                          channelMessages.messages.values.toList()),
                );
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: ListView.builder(
        reverse: true,
        itemCount: channelMessages.messages.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: AppColors.kGreenColor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.elliptical(20, 20),
                  topLeft: Radius.elliptical(20, 20),
                  topRight: Radius.elliptical(20, 20),
                  bottomRight: Radius.elliptical(10, 20)),
            ),
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    channelMessages.messages.values
                        .toList()
                        .reversed
                        .toList()[index],
                    style: Styles.textStyle14Golden,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: IconButton(
                        icon: SvgPicture.asset(
                          AppAssets.copy,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: IconButton(
                        icon: SvgPicture.asset(
                          AppAssets.share,
                          color: AppColors.kGoldenColor,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
