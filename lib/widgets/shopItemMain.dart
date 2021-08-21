import 'package:flutter/material.dart';
import '../screens/shopsDetailsScreen.dart';
class ShopItem extends StatelessWidget {
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


  ShopItem({
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
  });
  void selectShop(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      ShopsDetails.routeName,
      arguments: {
        'shop_id':shop_id,
        'shop_name':shop_name,
        'shop_country':shop_country,
        'shop_government':shop_government,
        'shop_city':shop_city,
        'shop_address':shop_address,
        'shop_description':shop_description,
        'shop_owner_id':shop_owner_id,
        'shop_photo':shop_photo,
        'shop_lat':shop_lat,
        'shop_log':shop_log,
        'shop_allowed_products':shop_allowed_products,
        'shop_allowed_offers':shop_allowed_offers,
        'shop_approved':shop_approved,
        'shop_views':shop_views,
        'shop_main_page':shop_main_page,
        'shop_home_delivery':shop_home_delivery,
        'shop_activity':shop_activity,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectShop(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        elevation: 4,
        margin: EdgeInsets.all(5),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                  ),
                  child: Image.network(
                    shop_photo,
                    height: 80,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 5,
                  right: 5,
                  child: Container(
                    width: 100,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Text(
                      shop_name,
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 6, horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.map,
                        size: 12,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        shop_city,
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.work,
                        size: 12,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        shop_activity,
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
