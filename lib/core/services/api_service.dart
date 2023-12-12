import 'dart:convert';
import 'dart:io';

import 'package:elresala/core/constants/app_api_routes.dart';
import 'package:elresala/core/errors/exception.dart';
import 'package:elresala/core/helpers/get_exception_from_status_code.dart';
import 'package:elresala/core/helpers/header.dart';
import 'package:elresala/core/helpers/network_info.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

class ApiService extends GetxService {
  final http.Client client;
  final NetworkInfo networkInfo;

  ApiService({
    required this.client,
    required this.networkInfo,
  });

  @override
  void onInit() {
    Get.find<Logger>().i('Start onInit in ApiServiceImpl');
    Get.find<Logger>().f('End onInit in ApiServiceImpl');
    super.onInit();
  }

  Future<Map<String, dynamic>> post({
    required String subUrl,
    required Map<String, dynamic> data,
    bool needToken = false,
  }) async {
    try {
      Get.find<Logger>().i('Start post `$subUrl` |ApiServiceImpl| data: $data');
      if (!(await networkInfo.isConnected)) {
        throw OfflineException();
      }
      final response = await client.post(
        Uri.http(
          AppApiRoutes.baseUrl,
          subUrl,
        ),
        body: json.encode(data),
        headers: setHeaders(),
      );
      getExceptionStatusCode(response);
      Get.find<Logger>().f('End post `$subUrl` |ApiServiceImpl| response: ${json.decode(response.body)}');
      return Future.value(json.decode(response.body));
    } catch (e) {
      Get.find<Logger>().e('End post `$subUrl` |ApiServiceImpl| Exception: ${e.runtimeType}');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> get({
    required String subUrl,
    Map<String, String>? parameters,
    bool needToken = false,
    String? key,
  }) async {
    try {
      Get.find<Logger>().i('Start get `$subUrl` |ApiServiceImpl| parameters: $parameters');
      if (!(await networkInfo.isConnected)) {
        throw OfflineException();
      }
      parameters?.removeWhere((key, value) => value == 'null');
      final response = await client.get(
        Uri.http(
          AppApiRoutes.baseUrl,
          subUrl,
          parameters,
        ),
        headers: setHeaders(),
      );
      getExceptionStatusCode(response);
      Get.find<Logger>().f('End get `$subUrl` |ApiServiceImpl| response: ${response.body}');
      return Future.value((json.decode(response.body)));
    } catch (e) {
      Get.find<Logger>().e('End get `$subUrl` |ApiServiceImpl| Exception: ${e.runtimeType}');
      rethrow;
    }
  }

  Future<String> downloadFile({
    required String url,
    required String subPath,
    required Function(double) onProgress,
  }) async {
    try {
      Get.find<Logger>().i('Start downloadFile `$url` |ApiServiceImpl| subPath: $subPath');
      if (!(await networkInfo.isConnected)) {
        throw OfflineException();
      }

      final http.Request request = http.Request('GET', Uri.parse(url));
      var response = await client.send(request);
      final contentLength = response.headers['content-length'];
      final totalBytes = contentLength != null ? int.parse(contentLength) : 0;
      int receivedBytes = 0;

      final appDocumentDirectory = await getApplicationDocumentsDirectory();
      final file = File('${appDocumentDirectory.path}/$subPath');
      final sink = file.openWrite();

      try {
        await response.stream.forEach(
          (List<int> chunk) {
            sink.add(chunk);
            receivedBytes += chunk.length;
            onProgress(receivedBytes / totalBytes);
          },
        );
      } catch (error) {
        Get.find<Logger>().e('Error during file download: $error');
      } finally {
        await sink.flush();
        await sink.close();
      }

      Get.find<Logger>().f('End downloadFile `$url` |ApiServiceImpl|');
      return Future.value(file.path);
    } catch (e) {
      Get.find<Logger>().e('End downloadFile `$url` |ApiServiceImpl| Exception: ${e.runtimeType}');
      rethrow;
    }
  }
}
