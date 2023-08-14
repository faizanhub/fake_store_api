import 'package:fake_store_api/core/services/auth_service.dart';
import 'package:fake_store_api/core/utils/utils.dart';
import 'package:fake_store_api/ui/screens/all_products/all_products_screen.dart';
import 'package:flutter/cupertino.dart';

class LoginVm extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  final emailC = TextEditingController();
  final passwordC = TextEditingController();

  bool isLoading = false;

  setIsLoading(bool newVal) {
    isLoading = newVal;
    notifyListeners();
  }

  bool obscureText = false;

  setIsObscureText(bool newVal) {
    obscureText = newVal;
    notifyListeners();
  }

  handleLoginTap(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    var data = {"username": emailC.text.trim(), "password": passwordC.text.trim()};
    setIsLoading(true);

    try {
      bool result = await AuthService().login(data);

      if (result) {
        setIsLoading(false);

        Navigator.pushNamed(context, AllProductsScreen.routeName);
      } else {
        setIsLoading(false);
        Utils.showFlushBar(context, 'Info', 'Username/password is not correct');
      }
    } catch (e) {
      setIsLoading(false);

      debugPrint(e.toString());
      Utils.showFlushBar(context, 'Info', 'Username/password is not correct');
    }
  }
}
