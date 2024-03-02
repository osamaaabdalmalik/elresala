import 'package:dartz/dartz.dart';
import 'package:elresala/core/errors/failures.dart';
import 'package:elresala/features/telegram_channels/data/models/telegram_channels_model.dart';
import 'package:elresala/features/telegram_channels/domain/repository/telegram_channels_repo.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class GetTelegramChannelsUseCase {
  final TelegramChannelsRepo telegramChannelsRepo;

  GetTelegramChannelsUseCase(this.telegramChannelsRepo);

  Future<Either<Failure, TelegramChannels>> call() async {
    Get.find<Logger>().i("Call GetTelegramChannelsUseCase");
    return await telegramChannelsRepo.getChannels();
  }
}
