import 'package:flutter/material.dart';
import '../screens/produtsDetailsScreen.dart';

class ProductItem extends StatelessWidget {
  final String product_id;
  final String product_name;
  final String product_price;
  final String product_description;
  final String product_photo;

  ProductItem({
    required this.product_id,
    required this.product_name,
    required this.product_price,
    required this.product_description,
    required this.product_photo,
  });
  void selectProduct(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      ProdutsDetails.routeName,
      arguments: {
        'product_id': product_id,
        'product_name': product_name,
        'product_price': product_price,
        'product_description': product_description,
        'product_photo': product_photo,
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectProduct(context),
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
                    product_photo,
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
                      product_name,
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
                        Icons.wb_incandescent_outlined,
                        size: 12,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        product_price+" \$",
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
                        Icons.analytics_outlined,
                        size: 12,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        product_description.substring(0,10)+"...",
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
