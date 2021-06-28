import 'package:flutter/material.dart';
import 'package:thrifter_hackon/Screens/cart.dart';
import 'package:thrifter_hackon/Screens/home_Screen.dart';

SliverAppBar sliverHeader(
    BuildContext context, IconData icon, String title, Function onPressed) {
  return SliverAppBar(
    backgroundColor: Colors.purple,
    shape: ContinuousRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(50),
        bottomRight: Radius.circular(50),
        topLeft: Radius.circular(isDrawerOpen ? 80 : 0),
      ),
    ),
    leading: IconButton(
      icon: Icon(icon),
      onPressed: onPressed,
    ),
    actions: <Widget>[
      IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            //Search
          }),
      IconButton(
          icon: Icon(Icons.shopping_cart_outlined),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ShoppingCart()));
            //Shop
          }),
    ],
    expandedHeight: 160.0,
    stretch: true,
    floating: true,
    pinned: true,
    flexibleSpace: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            Color(0xff693DC5),
            Color(0xffFF88E2),
          ],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
          topLeft: Radius.circular(isDrawerOpen ? 30.0 : 0.0),
        ),
      ),
      child: FlexibleSpaceBar(
        title: Text(
          title,
          style: TextStyle(fontSize: 22.0),
        ),
      ),
    ),
  );
}
