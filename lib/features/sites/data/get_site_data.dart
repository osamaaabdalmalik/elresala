import 'dart:convert';
import 'package:flutter/services.dart';

class HomeData {
  getData(String link, String nameSite) async {
    final String redjson = await rootBundle.loadString(link);
    Map<String, dynamic> response = await json.decode(redjson);
    return response[nameSite];
  }
}