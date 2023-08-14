import 'package:fake_store_api/constants/colors.dart';
import 'package:fake_store_api/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final bool isLoading;

  const CustomButton({required this.onTap, required this.text, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: 8.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32.px),
          color: AppColors.colorPrimary,
          // gradient:  LinearGradient(
          //   begin: Alignment.centerLeft,
          //   colors: [
          //     AppColors.colorPrimary,
          //     AppColors.colorPrimaryDark,
          //
          //   ],
          // ),
        ),
        child: Center(
          child: isLoading
              ? CircularProgressIndicator(
                  color: Colors.white,
                )
              : Text(
                  text,
                  style: normalTextStyle,
                ),
        ),
      ),
    );
  }
}
