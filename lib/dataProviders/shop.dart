import 'package:flutter/foundation.dart';

class Shop with ChangeNotifier {
  final String shop_id;
  final String shop_name;
  final String shop_country;
  final String shop_government;
  final String shop_city;
  final String shop_address;
  final String shop_description;
  final String shop_owner_id;
  final String shop_photo;
  final String shop_lat;
  final String shop_log;
  final String shop_allowed_products;
  final String shop_allowed_offers;
  final String shop_approved;
  final String shop_views;
  final String shop_main_page;
  final String shop_home_delivery;
  final String shop_activity;

  bool isFavorite;

  Shop({
    required this.shop_id,
    required this.shop_name,
    required this.shop_country,
    required this.shop_government,
    required this.shop_city,
    required this.shop_address,
    required this.shop_description,
    required this.shop_owner_id,
    required this.shop_photo,
    required this.shop_lat,
    required this.shop_log,
    required this.shop_allowed_products,
    required this.shop_allowed_offers,
    required this.shop_approved,
    required this.shop_views,
    required this.shop_main_page,
    required this.shop_home_delivery,
    required this.shop_activity,

    this.isFavorite = false,
  });

  void toggleFavoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
