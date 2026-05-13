import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/cart_controller.dart';
import '../../controllers/product_controller.dart';
import '../../routes/app_routes.dart';
import '../widgets/product_card.dart';

class ProductPage extends StatelessWidget {
  ProductPage({super.key});

  final ProductController controller = Get.find<ProductController>();
  final CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Home Page'),
        actions: [
          Obx(() {
            return Stack(
              children: [
                IconButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.cart);
                  },
                  icon: const Icon(Icons.shopping_cart),
                ),
                if (cartController.totalItems > 0)
                  Positioned(
                    right: 5,
                    top: 5,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '${cartController.totalItems}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            );
          }),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Obx(() {
          if (controller.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.blueGrey,
              ),
            );
          }

          return GridView.builder(
            itemCount: controller.products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 0.55,
            ),
            itemBuilder: (context, index) {
              return ProductCard(
                product: controller.products[index],
                onTap: () {
                  Get.toNamed(
                    AppRoutes.detail,
                    arguments: controller.products[index],
                  );
                },
                onAddToCart: () {
                  cartController.addToCart(controller.products[index]);

                  Get.snackbar(
                    'Berhasil',
                    'Produk berhasil ditambahkan ke keranjang',
                    snackPosition: SnackPosition.BOTTOM,
                  );
                },
              );
            },
          );
        }),
      ),
    );
  }
}