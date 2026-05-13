import 'package:get/get.dart';

import '../models/product.dart';

class CartController extends GetxController {
  final RxMap<Product, int> _cartProducts = <Product, int>{}.obs;

  Map<Product, int> get cartProducts => _cartProducts;

  void addToCart(Product product) {
    if (_cartProducts.containsKey(product)) {
      _cartProducts[product] = _cartProducts[product]! + 1;
    } else {
      _cartProducts[product] = 1;
    }

    _cartProducts.refresh();
  }

  void decreaseQuantity(Product product) {
    if (_cartProducts.containsKey(product)) {
      if (_cartProducts[product]! > 1) {
        _cartProducts[product] = _cartProducts[product]! - 1;
      } else {
        _cartProducts.remove(product);
      }
    }

    _cartProducts.refresh();
  }

  void removeFromCart(Product product) {
    _cartProducts.remove(product);
    _cartProducts.refresh();
  }

  double get totalPrice {
    double total = 0;

    _cartProducts.forEach((product, quantity) {
      total += product.price * quantity;
    });

    return total;
  }

  int get totalItems {
    int total = 0;

    _cartProducts.forEach((product, quantity) {
      total += quantity;
    });

    return total;
  }
}