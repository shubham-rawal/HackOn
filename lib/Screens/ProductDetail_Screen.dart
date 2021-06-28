import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thrifter_hackon/widgets/Buttons.dart';
import 'package:thrifter_hackon/constants.dart';

class ProductDetailScreen extends StatefulWidget {
  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int selectedPreviewImage = 0;

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
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
                          Color(0xff693DC5),
                          Color(0xffFF88E2),
                        ],
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: Text(
                      args['productName'],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
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
                    top: 150.0,
                    left: 20,
                    bottom: 0,
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          args['productImageURL'][selectedPreviewImage],
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                  args['productImageURL'].length,
                  (index) => imagesPreview(index, args),
                ),
              ],
            ),
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
                    '\u{20B9}${args['productPrice']}',
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
                args['productDescription'],
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
                        args['productSize'],
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
                        args['productColor'],
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
              buttonText: "BUY NOW",
              textColor: Color.fromRGBO(0, 189, 189, 1),
              buttonColor: Color.fromRGBO(0, 189, 189, 0.2),
              onTap: () {
                Navigator.pushNamed(context, shoppingcart);
              },
            ),
            Buttons(
              buttonText: "ADD TO CART",
              textColor: Colors.white,
              buttonColor: Color.fromRGBO(0, 189, 189, 1),
              onTap: () {
                Navigator.pushNamed(context, shoppingcart);
              },
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
