import 'package:shared_preferences/shared_preferences.dart';

abstract class MainLocalDataSource {}

class MainLocalDataSourceImpl extends MainLocalDataSource {
  final SharedPreferences pref;

  MainLocalDataSourceImpl({required this.pref});
}
