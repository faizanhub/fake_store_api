import 'package:fake_store_api/core/models/product.dart';
import 'package:fake_store_api/core/services/database_service.dart';
import 'package:fake_store_api/core/utils/utils.dart';
import 'package:flutter/cupertino.dart';

class AllProductsVm extends ChangeNotifier {
  late BuildContext context;

  AllProductsVm(this.context) {
    init();
  }

  List<Product> listOfProducts = [];

  init() async {
    try {
      listOfProducts = await DatabaseService().getAllCategories();
      notifyListeners();
    } catch (e) {
      print(e);
      Utils.showFlushBar(context, 'Error', 'Something went wrong');
    }
  }
}
