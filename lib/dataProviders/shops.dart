import 'package:flutter/material.dart';

import './shop.dart';

class Shops with ChangeNotifier {
  List<Shop> shopsItems = [
    Shop(
     shop_id:'1',
     shop_name:'Teeba',
      shop_country:'egypt',
      shop_government:'north_sinai',
      shop_city:'alarish',
      shop_address:'el-dawaran el tekeya street',
      shop_description:'super market to sell any daily living needs',
      shop_owner_id:'1',
      shop_photo:'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
      shop_lat:'30',
      shop_log:'30',
      shop_allowed_products:'5',
      shop_allowed_offers:'5',
      shop_approved:'0',
      shop_views:'0',
      shop_main_page:'0',
      shop_home_delivery:'0',
      shop_activity:'super-market',
    ),
    Shop(
      shop_id:'2',
      shop_name:'Abdo-ghatas',
      shop_country:'egypt',
      shop_government:'north_sinai',
      shop_city:'alarish',
      shop_address:'el-dawaran el tekeya street',
      shop_description:'super market to sell any daily living needs',
      shop_owner_id:'1',
      shop_photo:'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
      shop_lat:'30',
      shop_log:'30',
      shop_allowed_products:'5',
      shop_allowed_offers:'5',
      shop_approved:'0',
      shop_views:'0',
      shop_main_page:'0',
      shop_home_delivery:'0',
      shop_activity:'super-market',
    ),
    Shop(
      shop_id:'3',
      shop_name:'El-nour',
      shop_country:'egypt',
      shop_government:'north_sinai',
      shop_city:'alarish',
      shop_address:'el-dawaran el tekeya street',
      shop_description:'super market to sell any daily living needs',
      shop_owner_id:'2',
      shop_photo:'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
      shop_lat:'30',
      shop_log:'30',
      shop_allowed_products:'5',
      shop_allowed_offers:'5',
      shop_approved:'0',
      shop_views:'0',
      shop_main_page:'0',
      shop_home_delivery:'0',
      shop_activity:'super-market',
    ),
  ];
  // var _showFavoritesOnly = false;

  List<Shop> get items {
    // if (_showFavoritesOnly) {
    //   return _items.where((prodItem) => prodItem.isFavorite).toList();
    // }
    return [...shopsItems];
  }

  List<Shop> get favoriteItems {
    return shopsItems.where((shopItem) => shopItem.isFavorite).toList();
  }

  Shop findById(String id) {
    return shopsItems.firstWhere((shopItem) => shopItem.shop_id == id);
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
