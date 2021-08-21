import 'package:flutter/material.dart';

class ProdutsDetails extends StatefulWidget {
  static const routeName = '/produtsDetailsScreen';

  @override
  _ProdutsDetailsState createState() => _ProdutsDetailsState();
}

class _ProdutsDetailsState extends State<ProdutsDetails> {
  var isFavourite = false;

  @override
  Widget build(BuildContext context) {
    Map data = {};
    data = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            data["product_name"].toString().length > 16
                ? data["product_name"].toString().substring(0, 16)
                : data["product_name"].toString(),
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
        ),
        body: SafeArea(
          child: ListView(
            children: [
              hero(data),
              Expanded(child: section(data)),
            ],
          ),
        ));
  }

  Widget hero(Map data) {
    return Container(
      child: Stack(
        children: [
          Image.network(
            data["product_photo"],
            height: 200,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          Positioned(
              bottom: 10,
              right: 20,
              child: FloatingActionButton(
                backgroundColor: Colors.white,
                onPressed: () {
                  setState(() {
                    isFavourite = !isFavourite;
                  });
                },
                child: Icon(
                  isFavourite
                      ? Icons.favorite_outlined
                      : Icons.favorite_outline,
                  size: 34,
                ),
              ))
        ],
      ),
    );
  }

  Widget section(Map data) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  width: (MediaQuery.of(context).size.width) * 0.3,
                  child: Text(
                    "Product Price",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        color: Theme.of(context).primaryColorDark,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        height: 1.5),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  width: (MediaQuery.of(context).size.width) * 0.5,
                  child: Text(
                    data["product_price"] + "\$",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 14,
                        height: 1.5),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  width: (MediaQuery.of(context).size.width) * 0.3,
                  child: Text(
                    "Description",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        color: Theme.of(context).primaryColorDark,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        height: 1.5),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  width: (MediaQuery.of(context).size.width) * 0.5,
                  child: Text(
                    data["product_description"],
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 14,
                        height: 1.5),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            height: 40,
            width: double.infinity,
            child: FlatButton(
              padding: EdgeInsets.symmetric(horizontal: 30),
              color: Theme.of(context).primaryColor,
              onPressed: () {},
              textColor: Colors.white,
              child: Text("See Shop page"),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          )
        ],
      ),
    );
  }
}
