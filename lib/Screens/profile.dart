import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thrifter_hackon/Screens/AddProduct_Screen.dart';
import 'package:thrifter_hackon/Screens/AuthScreen.dart';

import '../Provider/authProvider.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final List images = [
    "https://www.thoughtco.com/thmb/C7RiS4QG5TXcBG2d_Sh9i4hFpg0=/3620x2036/smart/filters:no_upscale()/close-up-of-clothes-hanging-in-row-739240657-5a78b11f8e1b6e003715c0ec.jpg",
    "https://www.incimages.com/uploaded_files/image/1920x1080/getty_507716250_226806.jpg",
    "https://images.squarespace-cdn.com/content/v1/5442b6cce4b0cf00d1a3bef2/1596139091521-K8PDSWTUFK20VW0T7NFD/ke17ZwdGBToddI8pDm48kA7e4wRd4ZDldd6PbS9BVI5Zw-zPPgdn4jUwVcJE1ZvWQUxwkmyExglNqGp0IvTJZUJFbgE-7XRK3dMEBRBhUpyvXn8XMwMq-aCqUEV8fAVtSaljtELrLyv8fOgO87iUSoS6gU-xB5T__qABPCYgFO0/Organic-Clothing-Brands-MATE-The-Label",
    "https://www.thoughtco.com/thmb/C7RiS4QG5TXcBG2d_Sh9i4hFpg0=/3620x2036/smart/filters:no_upscale()/close-up-of-clothes-hanging-in-row-739240657-5a78b11f8e1b6e003715c0ec.jpg",
    "https://www.incimages.com/uploaded_files/image/1920x1080/getty_507716250_226806.jpg",
    "https://images.squarespace-cdn.com/content/v1/5442b6cce4b0cf00d1a3bef2/1596139091521-K8PDSWTUFK20VW0T7NFD/ke17ZwdGBToddI8pDm48kA7e4wRd4ZDldd6PbS9BVI5Zw-zPPgdn4jUwVcJE1ZvWQUxwkmyExglNqGp0IvTJZUJFbgE-7XRK3dMEBRBhUpyvXn8XMwMq-aCqUEV8fAVtSaljtELrLyv8fOgO87iUSoS6gU-xB5T__qABPCYgFO0/Organic-Clothing-Brands-MATE-The-Label",
    "https://www.thoughtco.com/thmb/C7RiS4QG5TXcBG2d_Sh9i4hFpg0=/3620x2036/smart/filters:no_upscale()/close-up-of-clothes-hanging-in-row-739240657-5a78b11f8e1b6e003715c0ec.jpg",
    "https://www.incimages.com/uploaded_files/image/1920x1080/getty_507716250_226806.jpg",
    "https://images.squarespace-cdn.com/content/v1/5442b6cce4b0cf00d1a3bef2/1596139091521-K8PDSWTUFK20VW0T7NFD/ke17ZwdGBToddI8pDm48kA7e4wRd4ZDldd6PbS9BVI5Zw-zPPgdn4jUwVcJE1ZvWQUxwkmyExglNqGp0IvTJZUJFbgE-7XRK3dMEBRBhUpyvXn8XMwMq-aCqUEV8fAVtSaljtELrLyv8fOgO87iUSoS6gU-xB5T__qABPCYgFO0/Organic-Clothing-Brands-MATE-The-Label",
    "https://www.thoughtco.com/thmb/C7RiS4QG5TXcBG2d_Sh9i4hFpg0=/3620x2036/smart/filters:no_upscale()/close-up-of-clothes-hanging-in-row-739240657-5a78b11f8e1b6e003715c0ec.jpg",
    "https://www.incimages.com/uploaded_files/image/1920x1080/getty_507716250_226806.jpg",
    "https://images.squarespace-cdn.com/content/v1/5442b6cce4b0cf00d1a3bef2/1596139091521-K8PDSWTUFK20VW0T7NFD/ke17ZwdGBToddI8pDm48kA7e4wRd4ZDldd6PbS9BVI5Zw-zPPgdn4jUwVcJE1ZvWQUxwkmyExglNqGp0IvTJZUJFbgE-7XRK3dMEBRBhUpyvXn8XMwMq-aCqUEV8fAVtSaljtELrLyv8fOgO87iUSoS6gU-xB5T__qABPCYgFO0/Organic-Clothing-Brands-MATE-The-Label",
    "https://www.thoughtco.com/thmb/C7RiS4QG5TXcBG2d_Sh9i4hFpg0=/3620x2036/smart/filters:no_upscale()/close-up-of-clothes-hanging-in-row-739240657-5a78b11f8e1b6e003715c0ec.jpg",
    "https://www.incimages.com/uploaded_files/image/1920x1080/getty_507716250_226806.jpg",
    "https://images.squarespace-cdn.com/content/v1/5442b6cce4b0cf00d1a3bef2/1596139091521-K8PDSWTUFK20VW0T7NFD/ke17ZwdGBToddI8pDm48kA7e4wRd4ZDldd6PbS9BVI5Zw-zPPgdn4jUwVcJE1ZvWQUxwkmyExglNqGp0IvTJZUJFbgE-7XRK3dMEBRBhUpyvXn8XMwMq-aCqUEV8fAVtSaljtELrLyv8fOgO87iUSoS6gU-xB5T__qABPCYgFO0/Organic-Clothing-Brands-MATE-The-Label",
  ];

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final authData = Provider.of<AuthData>(context, listen: false);
    authData.getCurrentUserData();

    return Scaffold(
      floatingActionButton: SizedBox(
        height: 60.0,
        width: 60.0,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              PageRouteBuilder(
                transitionDuration: Duration(milliseconds: 500),
                pageBuilder: (
                  BuildContext context,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation,
                ) {
                  return authData.auth.currentUser == null
                      ? AuthScreen()
                      : AddProduct();
                },
                transitionsBuilder: (
                  BuildContext context,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation,
                  Widget child,
                ) {
                  return Align(
                    child: FadeTransition(
                      opacity: animation,
                      child: child,
                    ),
                  );
                },
              ),
            );
          },
          elevation: 5.0,
          backgroundColor: Colors.white,
          child: Container(
            height: 50.0,
            width: 50.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(0xff693DC5),
                  Color(0xffFF88E2),
                ],
              ),
            ),
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 52.0,
            ),
          ),
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: mediaQuery.height * 0.33,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: mediaQuery.height * 0.25,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color(0xff693DC5),
                        Color(0xffFF88E2),
                      ],
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Container(
                    margin: EdgeInsets.all(5.0),
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
                    height: mediaQuery.height * 0.4,
                    width: double.infinity,
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: mediaQuery.height * 0.03,
                        ),
                        Text(
                          'Shubham',
                          // "${authData.currentUserData["Name"]}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w800,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        Text(
                          '@shubham123',
                          // "@${authData.currentUserData["closetName"]}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: IconButton(
                      icon: Icon(
                        Icons.navigate_before,
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ),
                Positioned(
                  left: mediaQuery.width * 0.36,
                  top: mediaQuery.height * 0.14,
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    child: CircleAvatar(
                      radius: 60.0,
                      foregroundImage: NetworkImage(
                        'https://media-exp3.licdn.com/dms/image/C4E03AQGKBm4sY3oivg/profile-displayphoto-shrink_400_400/0/1622804826344?e=1630540800&v=beta&t=TFcp405VNQw2h6eFM9gNiMQfyUTtXqlufOO2CiEflTk',
                      ),
                    ),
                  ),
                  height: mediaQuery.height * 0.2,
                  width: mediaQuery.width * 0.75,
                ),
              ],
            ),
          ),
          Flexible(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              height: mediaQuery.height * 0.67,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
                color: Color(0x3300BDBD),
              ),
              child: GridView.count(
                padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 25.0),
                crossAxisCount: 3,
                crossAxisSpacing: 17.5,
                mainAxisSpacing: 25.0,
                children: [
                  ...List.generate(
                    images.length,
                    (index) => imagesPreview(index),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  InkWell imagesPreview(int index) {
    return InkWell(
      onTap: () {
        setState(() {});
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Image.network(
          images[index],
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
