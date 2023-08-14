import 'package:fake_store_api/constants/colors.dart';
import 'package:fake_store_api/constants/text_styles.dart';
import 'package:fake_store_api/core/utils/screen_utilities.dart';
import 'package:fake_store_api/ui/screens/all_products/all_products_vm.dart';
import 'package:fake_store_api/ui/screens/all_products/components/product_card.dart';
import 'package:fake_store_api/ui/screens/product_details/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AllProductsScreen extends StatelessWidget {
  static const String routeName = '/all_products_screen';

  const AllProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => AllProductsVm(context),
      child: Consumer<AllProductsVm>(
        builder: (context, vm, child) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(8.h),
              child: AppBar(
                automaticallyImplyLeading: false,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(30),
                  ),
                ),
                title: Text(
                  'All Products',
                  style: normalTextStyle.copyWith(
                    fontSize: 25.px,
                    color: Colors.black,
                  ),
                ),
                centerTitle: true,
                backgroundColor: Colors.white,
                elevation: 20,
              ),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  vm.listOfProducts.isEmpty
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.colorPrimary,
                          ),
                        )
                      : Expanded(
                          child: ListView.separated(
                            itemCount: vm.listOfProducts.length,
                            separatorBuilder: (context, index) {
                              return kHeight(2.h);
                            },
                            itemBuilder: (context, index) {
                              var item = vm.listOfProducts[index];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, ProductDetailsScreen.routeName, arguments: item);
                                },
                                child: ProductCard(
                                  image: item.image ?? '',
                                  imageText: "${item.price} AED",
                                  rating: item.rating?.rate?.toDouble() ?? 0.0,
                                  productName: item.title ?? '',
                                  productDesc: item.description ?? '',
                                ),
                              );
                            },
                          ),
                        ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
