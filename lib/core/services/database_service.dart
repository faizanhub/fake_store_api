import 'package:fake_store_api/constants/configs.dart';
import 'package:fake_store_api/core/models/product.dart';
import 'package:fake_store_api/core/services/network_service.dart';
import 'package:flutter/foundation.dart';

class DatabaseService {
  final NetworkService _networkService = NetworkService();

  Future<List<Product>> getAllCategories() async {
    String allProductsUrl = AppConfigs.allProductsUrl;

    try {
      List responseList = await _networkService.getGetApiResponse(allProductsUrl);
      // var allCategoriesResponse = Product.fromJson(response);

      print(responseList);

      return responseList.map((product) => Product.fromJson(product)).toList();
    } catch (e) {
      debugPrint('Error occurred while getting all products $e');
      rethrow;
    }
  }
}
