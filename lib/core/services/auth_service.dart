import 'package:fake_store_api/constants/configs.dart';
import 'package:fake_store_api/core/services/network_service.dart';
import 'package:flutter/foundation.dart';

class AuthService {
  NetworkService _networkService = NetworkService();

  Future<bool> login(Map<String, dynamic> data) async {
    String loginUrl = AppConfigs.signInUrl;
    debugPrint(loginUrl);
    debugPrint(data.toString());

    try {
      await _networkService.getPostApiResponse(loginUrl, data);

      return true;
    } catch (e) {
      debugPrint('@AuthService => Error occurred while Login $e');
      rethrow;
    }
  }
}
