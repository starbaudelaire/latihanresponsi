import 'package:get/get.dart';

import '../bindings/cart_binding.dart';
import '../bindings/product_binding.dart';
import '../views/pages/cart_page.dart';
import '../views/pages/product_detail_page.dart';
import '../views/pages/product_page.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.products,
      page: () => ProductPage(),
      binding: ProductBinding(),
    ),
    GetPage(
      name: AppRoutes.detail,
      page: () => ProductDetailPage(),
    ),
    GetPage(
      name: AppRoutes.cart,
      page: () => CartPage(),
      binding: CartBinding(),
    ),
  ];
}