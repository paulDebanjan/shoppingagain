import 'package:flutter/material.dart';
import 'package:shoppingagain/modes/product.dart';

class Shop extends ChangeNotifier {
  // product for sell

  List<Product> _shop = [
    Product(
      name: 'Product 1',
      price: 3.55,
      description: 'Product Description...',
      imagePath: 'assets/product2.jpg',
    ),
    Product(
      name: 'Product 2',
      price: 3.55,
      description: 'Product Description...',
      imagePath: 'assets/product3.jpg',
    ),
    Product(
      name: 'Product 3',
      price: 3.55,
      description: 'Product Description...',
      imagePath: 'assets/product4.jpg',
    ),
    Product(
      name: 'Product 4',
      price: 3.55,
      description: 'Product Description...',
      imagePath: 'assets/product5.jpg',
    ),
  ];

  // user cart
  List<Product> _cart = [];
  //get product list
  List<Product> get shop => _shop;
  // get user cart
  List<Product> get cart => _cart;
  // add item to cart
  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}
