import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final String product_id;
  final String product_name;
  final String product_price;
  final String product_photo;
  final String product_description;
  final String shop_id;
  bool isFavorite;

  Product({
    required this.product_id,
    required this.product_name,
    required this.product_price,
    required this.product_photo,
    required this.product_description,
    required this.shop_id,
    this.isFavorite = false,
  });

  void toggleFavoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
