import 'package:flutter/material.dart';
import '../widgets/productItemMain.dart';
import '../dataProviders/products.dart';
import '../dataProviders/product.dart';

class MainProductsScreen extends StatelessWidget {
  List<Product> productsItems = Products().productsItems;

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(5),
      children: productsItems
          .map(
            (ProductData) => ProductItem(
                product_id: ProductData.product_id,
                product_name: ProductData.product_name,
                product_price: ProductData.product_price,
                product_description: ProductData.product_description,
                product_photo: ProductData.product_photo),
          )
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
