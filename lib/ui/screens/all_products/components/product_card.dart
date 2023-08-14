import 'package:fake_store_api/constants/text_styles.dart';
import 'package:fake_store_api/core/utils/screen_utilities.dart';
import 'package:fake_store_api/ui/widgets/rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(
      {Key? key,
      required this.image,
      required this.imageText,
      required this.rating,
      required this.productName,
      required this.productDesc})
      : super(key: key);

  final String image;
  final String imageText;
  final double rating;
  final String productName;
  final String productDesc;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight(2.h),

        ///List  of Product widgets
        Container(
            height: 30.h,
            width: 95.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.px),
                // color: Colors.red,
                image: DecorationImage(
                  image: NetworkImage(
                    image,
                  ),
                  fit: BoxFit.cover,
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.0.sp, vertical: 16.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        imageText,
                        style: normalTextStyle.copyWith(
                          fontSize: 22.px,
                        ),
                      ),
                      RatingBar(rating: rating),
                    ],
                  ),
                )
              ],
            )),

        kHeight(3.h),

        Text(
          productName,
          style: normalTextStyle.copyWith(
            fontStyle: FontStyle.italic,
            color: Colors.black.withOpacity(0.5),
          ),
        ),
        kHeight(1.h),
        Text(
          productDesc,
          style: normalTextStyle2.copyWith(
            fontSize: 15.px,
          ),
        ),
      ],
    );
  }
}
