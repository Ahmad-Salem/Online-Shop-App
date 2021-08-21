import 'package:flutter/material.dart';

class ShopsDetails extends StatefulWidget {
  static const routeName = '/shopsDetailsScreen';
  @override
  _ShopsDetailsState createState() => _ShopsDetailsState();
}

class _ShopsDetailsState extends State<ShopsDetails> {
  var isFavourite = false;
  @override
  Widget build(BuildContext context) {
    Map data = {};
    data = ModalRoute.of(context)!.settings.arguments as Map;
    print(data);
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            data["shop_name"].toString().length > 16
                ? data["shop_name"].toString().substring(0, 16)
                : data["shop_name"].toString(),
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
        ),
        body: SafeArea(
          child: ListView(
            children:<Widget> [
                hero(data),
                Container(child: Expanded(child: section(data))),
              ],
            ),
          ),
        );
  }


  Widget hero(Map data) {
    return Container(
      child: Stack(
        children: [
          Image.network(
            data["shop_photo"],
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
                    data["shop_description"],
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
                    "Country",
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
                    data["shop_country"],
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
                    "Government",
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
                    data["shop_government"],
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
                    "City",
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
                    data["shop_city"],
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
                    "Address",
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
                    data["shop_address"],
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
                    "Approved",
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
                    data["shop_approved"].toString()=="1"?"Approved":"Not Approved",
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
                    "Views",
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
                    data["shop_views"],
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
                    "On Main Page",
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
                    data["shop_main_page"].toString()=="1"?"Available":"Not available",
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
                    "Home Delivery",
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
                    data["shop_home_delivery"].toString()=="1"?"Available":"Not available",
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
                    "Shop Activity",
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
                    data["shop_activity"],
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
                    "Shop Activity",
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
                    data["shop_activity"],
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
              child: Text("See Shop location"),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          SizedBox(height: 10),
          SizedBox(
            height: 40,
            width: double.infinity,
            child: FlatButton(
              padding: EdgeInsets.symmetric(horizontal: 30),
              color: Theme.of(context).primaryColor,
              onPressed: () {},
              textColor: Colors.white,
              child: Text("See Shop Products"),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
