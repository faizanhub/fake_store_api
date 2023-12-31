import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

abstract class BaseNetworkService {
  Future<dynamic> getGetApiResponse(String url);

  Future<dynamic> getPostApiResponse(String url, Map<String, dynamic> data);
}

class NetworkService extends BaseNetworkService {
  @override
  Future<dynamic> getGetApiResponse(String url) async {
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);

        return jsonResponse;
      } else {
        debugPrint('Request failed with status: ${response.statusCode}.');
        throw Exception('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      throw Exception('Something wrong happened while requesting http service $e');
    }
  }

  @override
  Future getPostApiResponse(String url, Map<String, dynamic> data, [String? token]) async {
    try {
      var response = await http.post(Uri.parse(url),
          body: jsonEncode(data), headers: {"Authorization": "Bearer $token", "Content-Type": "application/json"});
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);

        return jsonResponse;
      } else {
        debugPrint('Request failed with status: ${response.statusCode}.');
        throw Exception('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      throw Exception('Something wrong happened while requesting http service $e');
    }
  }
}
