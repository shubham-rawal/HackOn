import 'dart:ui';

import 'package:flutter/material.dart';
import "package:provider/provider.dart";
import 'package:thrifter_hackon/Provider/authProvider.dart';
import 'package:thrifter_hackon/constants.dart';
import 'package:thrifter_hackon/widgets/SliverHeader.dart';

double xOffset = 0;
double yOffset = 0;
double scaleFactor = 1;
bool isDrawerOpen = false;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void drawerHandler() {
    setState(() {
      if (!isDrawerOpen) {
        xOffset = MediaQuery.of(context).size.width * 0.53;
        yOffset = MediaQuery.of(context).size.height * 0.2;

        scaleFactor = 0.7;
        isDrawerOpen = true;
      } else {
        xOffset = 0;
        yOffset = 0;

        scaleFactor = 1;
        isDrawerOpen = false;
      }
    });
  }

  List<String> titles = [
    'Men',
    'Women',
    'Shoes',
    'Accessories',
    'Unisex',
  ];

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final authData = Provider.of<AuthData>(context);
    authData.getCurrentUserData();
    var currentUserData = authData.currentUserData;
    return GestureDetector(
      onTap: isDrawerOpen ? drawerHandler : null,
      child: AnimatedContainer(
        transform: Matrix4.translationValues(xOffset, yOffset, 0)
          ..scale(scaleFactor)
          ..rotateY(isDrawerOpen ? -0.7 : 0),
        duration: Duration(milliseconds: 250),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(isDrawerOpen ? 40.0 : 0.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[900].withOpacity(0.5),
              spreadRadius: 35,
              blurRadius: 27,
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: CustomScrollView(
          slivers: [
            sliverHeader(
              context,
              Icons.menu,
              'Hey Shubham!',
              // authData.currentUserData.isNotEmpty
              //     ? "Hey ${currentUserData["Name"]}!"
              //     : "Hey User!",
              drawerHandler,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          height: mediaQuery.height * 0.02,
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: kHorizontalListHeight,
                          child: ListView.separated(
                            itemCount: 5,
                            shrinkWrap: true,
                            padding: EdgeInsets.symmetric(
                              horizontal: 25.0,
                              vertical: 5.0,
                            ),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return HorizontalListButton(
                                text: titles[index],
                                onPressed: () {
                                  Navigator.pushNamed(context, categories);
                                },
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                width: mediaQuery.width * 0.05,
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: mediaQuery.height * 0.01,
                        ),
                        ThriftStoreDescriptionBox(
                          thriftDescription:
                              '"It takes 650 gallons of water to make one new cotton \n t-shirt."',
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 5.0),
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            'Check these out!',
                            style: kHeadingTextStyle,
                          ),
                        ),
                        GridView.count(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.all(20.0),
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          crossAxisCount: 2,
                          children: [
                            GridContainer(
                              category: 'tops.jpeg',
                              title: 'TOPS',
                              onPressed: () {
                                print('here');

                                Navigator.pushNamed(context, closetScreen);
                              },
                            ),
                            GridContainer(
                              category: 'party_wear.jpg',
                              title: 'JEANS',
                              onPressed: () {
                                print('here');

                                Navigator.pushNamed(context, closetScreen);
                              },
                            ),
                            GridContainer(
                              category: 'party_wear.jpg',
                              title: 'ETHNIC',
                              onPressed: () {
                                print('here');
                                Navigator.pushNamed(context, closetScreen);
                              },
                            ),
                            GridContainer(
                              category: 'party_wear.jpg',
                              title: 'SHOES',
                              onPressed: () {
                                print('here');

                                Navigator.pushNamed(context, closetScreen);
                              },
                            ),
                          ],
                        ),
                        MaterialButton(
                          child: ThriftStoreDescriptionBox(
                            thriftDescription: "Become a thrifter NOW!",
                          ),
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              addProduct,
                            );
                          },
                        ),
                        SizedBox(
                          height: 100,
                        ),
                      ]);
                },
                childCount: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GridContainer extends StatelessWidget {
  GridContainer(
      {@required this.category,
      @required this.title,
      @required this.onPressed});

  final String category;
  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          image: DecorationImage(
            image: AssetImage('images/$category'),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 0.1, sigmaY: 0.1),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.45)),
            child: Text(
              title,
              style: kCategoryGridTextStyle,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

class ThriftStoreDescriptionBox extends StatelessWidget {
  ThriftStoreDescriptionBox({@required this.thriftDescription});

  final String thriftDescription;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        padding: EdgeInsets.all(30.0),
        alignment: Alignment.centerLeft,
        decoration: kDescriptiveBoxStyle,
        child: Text(
          thriftDescription,
          style: kBodyTextStyle.copyWith(fontSize: 22.0),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class HorizontalListButton extends StatelessWidget {
  HorizontalListButton({@required this.text, @required this.onPressed});

  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      padding: EdgeInsets.all(15.0),
      fillColor: kHorizontalListButtonColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45.0)),
      onPressed: onPressed,
      child: Container(
        child: Text(
          text,
          style: kBodyTextStyle,
        ),
      ),
    );
  }
}
