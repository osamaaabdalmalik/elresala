import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService extends GetxService {
  final SharedPreferences pref;

  SharedPreferencesService({required this.pref});

  T? getPrimitiveData<T>({required String key}) {
    Get.find<Logger>().i("Start `getPrimitiveData` in |MainLocalDataSourceImpl| ~~key~~ $key");
    T? value;
    if (T.toString() == 'int') {
      value = pref.getInt(key) as T?;
    }
    if (T.toString() == 'double') {
      value = pref.getDouble(key) as T?;
    }
    if (T.toString() == 'bool') {
      value = pref.getBool(key) as T?;
    }
    if (T.toString() == 'String') {
      value = pref.getString(key) as T?;
    }
    Get.find<Logger>().f(
      "End `getPrimitiveData` in |MainLocalDataSourceImpl| ~~$key~~ $value",
    );
    return value;
  }

  Future<Unit> setPrimitiveData({required String key, required dynamic value}) async {
    Get.find<Logger>().i(
      "Start `setPrimitiveData` in |MainLocalDataSourceImpl| ~~key~~ $key, ~~value~~ $value",
    );
    bool isSetDone = false;
    if (value is int) {
      isSetDone = await pref.setInt(key, value);
      return Future.value(unit);
    }
    if (value is double) {
      isSetDone = await pref.setDouble(key, value);
      return Future.value(unit);
    }
    if (value is bool) {
      isSetDone = await pref.setBool(key, value);
      return Future.value(unit);
    }
    if (value is String) {
      isSetDone = await pref.setString(key, value);
      return Future.value(unit);
    }
    if (value == null) {
      isSetDone = await pref.remove(key);
      return Future.value(unit);
    }
    Get.find<Logger>().f(
      "End `setPrimitiveData` in |MainLocalDataSourceImpl| ~~isSetDone~~ $isSetDone",
    );
    return Future.value(unit);
  }

  Future<Unit> clear() async {
    Get.find<Logger>().i("Start `clear` in |MainLocalDataSourceImpl|");
    final clear = await pref.clear();
    Get.find<Logger>().f(
      "End `clear` in |MainLocalDataSourceImpl| ~~isClear~~ $clear ",
    );
    return Future.value(unit);
  }
}
