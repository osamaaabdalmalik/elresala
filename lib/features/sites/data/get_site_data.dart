import 'dart:convert';

import 'package:elresala/core/services/archive_service.dart';
import 'package:get/get.dart';

class HomeData {
  ArchiveService archiveService = Get.find();

  getData(String link, String nameSite) async {
    final String? redjson = await archiveService.readFile(name: link);
    Map<String, dynamic> response = await json.decode(redjson!);
    return response[nameSite];
  }
}
