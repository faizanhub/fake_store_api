import 'package:fake_store_api/constants/colors.dart';
import 'package:fake_store_api/constants/text_styles.dart';
import 'package:fake_store_api/core/utils/screen_utilities.dart';
import 'package:fake_store_api/core/utils/validators.dart';
import 'package:fake_store_api/ui/screens/login/login_vm.dart';
import 'package:fake_store_api/ui/widgets/custom_button.dart';
import 'package:fake_store_api/ui/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/login_screen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => LoginVm(),
      child: Consumer<LoginVm>(
        builder: (context, vm, child) {
          return GestureDetector(
            onTap: () {
              if (FocusScope.of(context).hasFocus) {
                FocusScope.of(context).unfocus();
              }
            },
            child: Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    ///50% Container with center text and bottom left
                    Container(
                      height: 50.h,
                      width: 100.w,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(begin: Alignment.centerLeft, colors: [
                        AppColors.colorPrimaryDark,
                        AppColors.colorPrimary,
                      ])),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(),
                          Text(
                            'STC\nHealth',
                            textAlign: TextAlign.center,
                            style: normalTextStyle.copyWith(
                              fontSize: 36.px,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 28.0.sp, left: 20.sp),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Log In',
                                  style: normalTextStyle.copyWith(
                                    fontSize: 34.px,
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),

                    ///Text Fields
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.0.sp),
                      child: Form(
                        key: vm.formKey,
                        child: Column(
                          children: [
                            kHeight(3.h),
                            CustomTextField(
                              controller: vm.emailC,
                              hintText: 'Email',
                              labelText: 'Email',
                              validator: validateNormalField,
                            ),
                            kHeight(3.h),

                            CustomTextField(
                              controller: vm.passwordC,
                              hintText: 'Password',
                              labelText: 'Password',
                              suffixIcon: GestureDetector(
                                  onTap: () {
                                    vm.setIsObscureText(!vm.obscureText);
                                  },
                                  child: vm.obscureText
                                      ? const Icon(
                                          Icons.visibility,
                                          color: Colors.grey,
                                        )
                                      : const Icon(
                                          Icons.visibility_off,
                                          color: Colors.grey,
                                        )),
                              obscureText: vm.obscureText,
                              validator: validatePasswordField,
                            ),

                            kHeight(4.h),

                            ///Continue Button
                            CustomButton(
                              onTap: () {
                                vm.handleLoginTap(context);
                              },
                              isLoading: vm.isLoading,
                              text: 'Continue',
                            ),
                            kHeight(2.h),

                            ///Need Help Text
                            Text('Need Help?', style: normalTextStyle2)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
