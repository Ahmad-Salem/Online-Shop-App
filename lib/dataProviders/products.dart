import 'package:flutter/material.dart';

import './product.dart';

class Products with ChangeNotifier {
  List<Product> productsItems = [
    Product(
      product_id:'1',
      product_name:'T-shirt0',
      product_price:'30',
      shop_id:'1',
      product_photo:'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
      product_description:'red T-shirts for men.',
    ),
    Product(
      product_id:'2',
      product_name:'T-shirt1',
      product_price:'50',
      shop_id:'2',
      product_photo:'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
      product_description:'red T-shirts for women.',
    ),
    Product(
      product_id:'3',
      product_name:'T-shirt2',
      product_price:'40',
      shop_id:'3',
      product_photo:'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
      product_description:'red T-shirts for women.',
    ),
  ];
  // var _showFavoritesOnly = false;

  List<Product> get items {
    // if (_showFavoritesOnly) {
    //   return _items.where((prodItem) => prodItem.isFavorite).toList();
    // }
    return [...productsItems];
  }

  List<Product> get favoriteItems {
    return productsItems.where((productItem) => productItem.isFavorite).toList();
  }

  Product findById(String id) {
    return productsItems.firstWhere((productItem) => productItem.product_id == id);
  }

  // void showFavoritesOnly() {
  //   _showFavoritesOnly = true;
  //   notifyListeners();
  // }

  // void showAll() {
  //   _showFavoritesOnly = false;
  //   notifyListeners();
  // }

  void addProduct() {
    // _items.add(value);
    notifyListeners();
  }
}
