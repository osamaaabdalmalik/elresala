import 'package:get/get.dart';
import 'package:elresala/core/constants/app_enums.dart';
import 'package:elresala/core/constants/app_translation_keys.dart';
import 'package:elresala/core/errors/failures.dart';
import 'package:elresala/core/services/easy_loader_service.dart';

StateType getStateFromFailure(Failure failure) {
  if (failure is OfflineFailure) {
    return StateType.offline;
  } else if (failure is UnAuthenticatedFailure) {
    EasyLoaderService.showError(
      message: AppTranslationKeys.forbidden.tr,
      durationSeconds: 5,
    );
    return StateType.forbidden;
  } else if (failure is UnAuthorizedFailure) {
    EasyLoaderService.showError(
      message: AppTranslationKeys.unauthorized.tr,
      durationSeconds: 5,
    );
    return StateType.unAuthorized;
  } else if (failure is NotFoundFailure) {
    EasyLoaderService.showError(
      message: AppTranslationKeys.notFound.tr,
      durationSeconds: 5,
    );
    return StateType.notFound;
  } else if (failure is BadRequestFailure) {
    return StateType.badRequest;
  } else if (failure is InternalServerErrorFailure) {
    return StateType.internalServerProblem;
  } else {
    return StateType.unexpectedProblem;
  }
}
