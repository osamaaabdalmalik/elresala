import 'package:dartz/dartz.dart';
import 'package:elresala/core/errors/failures.dart';
import 'package:elresala/features/telegram_channels/data/models/telegram_channels_model.dart';

abstract class TelegramChannelsRepo {
  Future<Either<Failure, TelegramChannels>> getChannels();
}
