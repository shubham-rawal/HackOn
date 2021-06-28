import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:thrifter_hackon/Screens/categories.dart';
import 'home_Screen.dart';
import 'package:thrifter_hackon/Screens/home_Screen.dart';
import 'package:thrifter_hackon/constants.dart';

import '../Provider/authProvider.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    final authData = Provider.of<AuthData>(context);
    return Container(
      padding: EdgeInsets.only(left: 20.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.deepPurpleAccent,
            Colors.pinkAccent,
          ],
        ),
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  height: 30.0,
                ),
                CircleAvatar(
                  radius: 25,
                  foregroundImage: NetworkImage(
                      'https://media-exp3.licdn.com/dms/image/C4E03AQGKBm4sY3oivg/profile-displayphoto-shrink_400_400/0/1622804826344?e=1630540800&v=beta&t=TFcp405VNQw2h6eFM9gNiMQfyUTtXqlufOO2CiEflTk'),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Shubham',
                      // "Name",
                      style: kHeadingTextStyle.copyWith(
                        color: Colors.white,
                        fontSize: 40,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      '@shubham123',
                      // '@username',
                      style: kBodyTextStyle.copyWith(),
                      textAlign: TextAlign.start,
                    ),
                  ],
                )
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MenuOption(
                    icon: Icons.person,
                    title: 'Profile',
                    onTap: authData.auth.currentUser == null
                        ? () =>
                            Navigator.of(context).pushReplacementNamed(login)
                        : () {
                            Navigator.pushNamed(context, profile);
                          },
                  ),
                  MenuOption(
                    icon: Icons.category,
                    title: 'Categories',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Categories()));
                    },
                  ),
                  MenuOption(
                    icon: Icons.shopping_bag,
                    title: 'My Orders',
                    onTap: () {
                      Navigator.pushNamed(context, shoppingcart);
                    },
                  ),
                  MenuOption(
                    icon: Icons.star,
                    title: 'All Closets',
                    onTap: () {
                      Navigator.pushNamed(context, closetScreen);
                    },
                  ),
                  MenuOption(
                    icon: Icons.handyman,
                    title: 'Become a thrifter',
                    onTap: () {},
                  ),
                ],
              ),
            ),
            ListTile(
              onTap: authData.auth.currentUser == null
                  ? () {
                      Navigator.of(context).pushNamed(login);
                    }
                  : () async {
                      setState(() {
                        if (!isDrawerOpen) {
                          xOffset = 230;
                          yOffset = 150;

                          scaleFactor = 0.7;
                          isDrawerOpen = true;
                        } else {
                          xOffset = 0;
                          yOffset = 0;

                          scaleFactor = 1;
                          isDrawerOpen = false;
                        }
                        // userId = null;
                      });
                      await authData.signOut(context);
                    },
              contentPadding: EdgeInsets.fromLTRB(0, 20, 20, 20),
              leading: Icon(
                authData.auth.currentUser == null
                    ? Icons.login_rounded
                    : Icons.logout,
                size: 30.0,
                color: Colors.white,
              ),
              title: Text(
                authData.auth.currentUser == null ? "Login" : 'Logout',
                style: kDrawerTextStyle,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MenuOption extends StatelessWidget {
  MenuOption({@required this.icon, @required this.title, @required this.onTap});

  final Function onTap;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.fromLTRB(0, 5, 20, 5),
      onTap: onTap,
      leading: Icon(
        icon,
        color: Colors.white,
        size: 30,
      ),
      tileColor: Colors.transparent,
      title: Text(
        title,
        style: kDrawerTextStyle,
      ),
    );
  }
}
