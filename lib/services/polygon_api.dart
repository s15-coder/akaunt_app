import 'dart:developer';

import 'package:http/http.dart' as http;

class PolygonApi {
  static const _apiKey = 'Bearer etpOgDGzFMCRTjFhcdGW6BIFx_phQze0';
  static const _host = 'https://api.polygon.io/v2/aggs/ticker';
  static Future<http.Response> httpGet(
    String path,
  ) async {
    final endpoint = Uri.parse("$_host/$path");
    try {
      final resp =
          await http.get(endpoint, headers: {'Authorization': _apiKey});
      return resp;
    } catch (e) {
      log('Get error $e');
      throw 'Get error';
    }
  }
}
