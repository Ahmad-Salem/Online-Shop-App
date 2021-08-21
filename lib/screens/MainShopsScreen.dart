import 'package:flutter/material.dart';
import '../widgets/shopItemMain.dart';
import '../dataProviders/shops.dart';
import '../dataProviders/shop.dart';

class Home extends StatelessWidget {
  List<Shop> shopsItems = Shops().shopsItems;

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(5),
      children: shopsItems
          .map((ShopData) => ShopItem(
              shop_id: ShopData.shop_id.toString(),
              shop_name: ShopData.shop_name.toString(),
              shop_country:ShopData.shop_country.toString(),
              shop_government: ShopData.shop_government.toString(),
              shop_city: ShopData.shop_city.toString(),
              shop_address: ShopData.shop_address.toString(),
              shop_description: ShopData.shop_description.toString(),
              shop_owner_id: ShopData.shop_owner_id.toString(),
              shop_photo: ShopData.shop_photo.toString(),
              shop_lat: ShopData.shop_lat.toString(),
              shop_log: ShopData.shop_log.toString(),
              shop_allowed_products: ShopData.shop_allowed_products.toString(),
              shop_allowed_offers: ShopData.shop_allowed_offers.toString(),
              shop_approved: ShopData.shop_approved.toString(),
              shop_views: ShopData.shop_views.toString(),
              shop_main_page: ShopData.shop_main_page.toString(),
              shop_home_delivery: ShopData.shop_home_delivery.toString(),
              shop_activity: ShopData.shop_activity.toString()))
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 300,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
      ),
    );
  }
}
