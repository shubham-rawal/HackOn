import 'package:flutter/material.dart';
import 'package:thrifter_hackon/Screens/cart.dart';
import 'package:thrifter_hackon/constants.dart';

import 'package:thrifter_hackon/widgets/SliverHeader.dart';
import 'package:thrifter_hackon/widgets/Buttons.dart';

// Map<String, dynamic> items = {"0" : "assest/images/men1.jpg", "1" :"assest/images/jean2.jpeg" };
List items = ["assest/images/men1.jpg", "assest/images/jean2.jpeg"];
int index = 0;

class WomenJeans extends StatefulWidget {
  @override
  _WomenJeansState createState() => _WomenJeansState();
}

class _WomenJeansState extends State<WomenJeans> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          sliverHeader(context, Icons.navigate_before, "\t\t\tJeans", () {
            Navigator.pop(context);
          }),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Column(
                  children: [
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MaterialButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                // settings: RouteSettings(
                                //     arguments: items),
                                builder: (context) => ProductDetailSecond(),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            height: MediaQuery.of(context).size.height * 0.25,
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Image(
                              image: AssetImage("assest/images/jeansW2.jp2"),
                            ),
                          ),
                        ),
                        MaterialButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                // settings: RouteSettings(
                                //     arguments: items),
                                builder: (context) => ProductDetailSecond(),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                            ),
                            height: MediaQuery.of(context).size.height * 0.25,
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Image(
                              image: AssetImage("assest/images/men1.jpg"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }
}

// class MenShoes extends StatefulWidget {
//   @override
//   _MenShoesState createState() => _MenShoesState();
// }

// class _MenShoesState extends State<MenShoes> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomScrollView(
//         slivers: <Widget>[
//           sliverHeader(Icons.navigate_before, "\t\t\tShoes", () {
//             Navigator.pop(context);
//           }),
//           SliverList(
//             delegate: SliverChildBuilderDelegate(
//               (BuildContext context, int index) {
//                 return Column(
//                   children: [
//                     SizedBox(
//                       height: 100,
//                     ),
//                     Container(
//                       child: Image(
//                         image: AssetImage("assest/images/nothing.gif"),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 200,
//                     ),
//                   ],
//                 );
//               },
//               childCount: 1,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class MenShirt extends StatefulWidget {
//   @override
//   _MenShirtState createState() => _MenShirtState();
// }

// class _MenShirtState extends State<MenShirt> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomScrollView(
//         slivers: <Widget>[
//           sliverHeader(Icons.navigate_before, "\t\t\tShirts", () {
//             Navigator.pop(context);
//           }),
//           SliverList(
//             delegate: SliverChildBuilderDelegate(
//               (BuildContext context, int index) {
//                 return Column(
//                   children: [
//                     SizedBox(
//                       height: 20.0,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         MaterialButton(
//                           onPressed: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 // settings: RouteSettings(
//                                 //     arguments: items),
//                                 builder: (context) => ProductDetailSecond(),
//                               ),
//                             );
//                           },
//                           child: Container(
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             height: MediaQuery.of(context).size.height * 0.25,
//                             width: MediaQuery.of(context).size.width * 0.4,
//                             child: Image(
//                               image: AssetImage("assest/images/st1.jpg"),
//                             ),
//                           ),
//                         ),
//                         MaterialButton(
//                           onPressed: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 // settings: RouteSettings(
//                                 //     arguments: items),
//                                 builder: (context) => ProductDetailSecond(),
//                               ),
//                             );
//                           },
//                           child: Container(
//                             decoration: BoxDecoration(
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(20.0)),
//                             ),
//                             height: MediaQuery.of(context).size.height * 0.25,
//                             width: MediaQuery.of(context).size.width * 0.4,
//                             // child: Image(
//                             //   image: AssetImage("assest/images/men1.jpg"),
//                             // ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 );
//               },
//               childCount: 1,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class MenAcc extends StatefulWidget {
//   @override
//   _MenAccState createState() => _MenAccState();
// }

// class _MenAccState extends State<MenAcc> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomScrollView(
//         slivers: <Widget>[
//           sliverHeader(Icons.navigate_before, "Accesories", () {
//             Navigator.pop(context);
//           }),
//           SliverList(
//             delegate: SliverChildBuilderDelegate(
//               (BuildContext context, int index) {
//                 return Column(
//                   children: [
//                     SizedBox(
//                       height: 100,
//                     ),
//                     Container(
//                       child: Image(
//                         image: AssetImage("assest/images/nothing.gif"),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 200,
//                     ),
//                   ],
//                 );
//               },
//               childCount: 1,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class MenJacket extends StatefulWidget {
//   @override
//   _MenJacketState createState() => _MenJacketState();
// }

// class _MenJacketState extends State<MenJacket> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomScrollView(
//         slivers: <Widget>[
//           sliverHeader(Icons.navigate_before, "Jackets", () {
//             Navigator.pop(context);
//           }),
//           SliverList(
//             delegate: SliverChildBuilderDelegate(
//               (BuildContext context, int index) {
//                 return Column(
//                   children: [
//                     SizedBox(
//                       height: 100,
//                     ),
//                     Container(
//                       child: Image(
//                         image: AssetImage("assest/images/nothing.gif"),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 200,
//                     ),
//                   ],
//                 );
//               },
//               childCount: 1,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class ProductDetailSecond extends StatefulWidget {
  @override
  _ProductDetailSecondState createState() => _ProductDetailSecondState();
}

class _ProductDetailSecondState extends State<ProductDetailSecond> {
  int selectedPreviewImage = 0;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: mediaQuery.height * 0.6,
              child: Stack(
                children: [
                  Container(
                    height: mediaQuery.height * 0.3,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color.fromRGBO(158, 111, 255, 1),
                          Color.fromRGBO(255, 136, 226, 1),
                        ],
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: Text(
                      "Jeans",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 150.0,
                    left: 20,
                    bottom: 0,
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          "assest/images/men1.jpg",
                          fit: BoxFit.fill,
                          height: mediaQuery.height * 0.5,
                          width: mediaQuery.width * 0.75,
                          scale: 0.7,
                        ),
                      ),
                      height: mediaQuery.height * 0.5,
                      width: mediaQuery.width * 0.75,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     ...List.generate(
            //       args['productImageURL'].length,
            //       (index) => imagesPreview(index, args),
            //     ),
            //   ],
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 30.0,
                horizontal: 30.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Price",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    '5000',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            SizedBox(height: mediaQuery.height * 0.02),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 30.0,
              ),
              child: Text(
                "Beautiful Jeans",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 30.0,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Size",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "M",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Divider(thickness: 1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Color",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "Light Green",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: mediaQuery.height * 0.03),
            Buttons(
              onTap: () {
                Navigator.pushNamed(context, shoppingcart);
              },
              buttonText: "BUY NOW",
              textColor: Color.fromRGBO(0, 189, 189, 1),
              buttonColor: Color.fromRGBO(0, 189, 189, 0.2),
            ),
            Buttons(
              onTap: () {
                Navigator.pushNamed(context, shoppingcart);
              },
              buttonText: "ADD TO CART",
              textColor: Colors.white,
              buttonColor: Color.fromRGBO(0, 189, 189, 1),
            ),
          ],
        ),
      ),
    );
  }

  InkWell imagesPreview(int index, Map<String, dynamic> args) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedPreviewImage = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(7.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13),
            border: Border.all(
              color: selectedPreviewImage == index
                  ? Color.fromRGBO(0, 189, 189, 1)
                  : Colors.transparent,
              width: 2,
            ),
          ),
          height: MediaQuery.of(context).size.height * 0.075,
          width: MediaQuery.of(context).size.width * 0.15,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(13),
            child: Image.network(
              args['productImageURL'][index],
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
