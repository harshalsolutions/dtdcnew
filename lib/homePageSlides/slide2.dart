import 'package:flutter/material.dart';

import '../constants/constants.dart';

class Slide2 extends StatelessWidget {
  const Slide2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.079),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(screenWidth * 0.0225),
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: screenWidth * 0.0233,
                      ),
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: screenWidth * 0.399,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Home Pickup services with affordable prices!',
                              style: TextStyle(
                                  fontFamily: 'Archivo',
                                  fontWeight: FontWeight.w700,
                                  fontSize: screenHeight * 0.018,
                                  color: primaryColor1,
                                  letterSpacing: 0.5),
                            ),
                            SizedBox(
                              height: screenHeight * 0.0248,
                            ),
                            RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: 'Get ',
                                      style: TextStyle(
                                          fontFamily: "Archivo",
                                          fontWeight: FontWeight.w700,
                                          fontSize: screenHeight * 0.018,
                                          color: primaryColor1)),
                                  TextSpan(
                                      text: '10% Off ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: screenHeight * 0.0225,
                                          color: Colors.black)),
                                  TextSpan(
                                      text: 'on your first order',
                                      style: TextStyle(
                                          fontFamily: "Archivo",
                                          fontWeight: FontWeight.w700,
                                          fontSize: screenHeight * 0.018,
                                          color: primaryColor1)),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: screenHeight * 0.011,
                            ),
                            GestureDetector(
                              onTap: null,
                              child: Container(
                                height: screenHeight * 0.0338,
                                width: screenWidth * 0.28,
                                decoration: BoxDecoration(
                                    color: primaryColor1,
                                    borderRadius: BorderRadius.circular(8.0)),
                                child: Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(context, '/sixth');
                                    },
                                    child: Text(
                                      'Place Order',
                                      style: TextStyle(
                                          fontFamily: 'Archivo',
                                          fontWeight: FontWeight.w700,
                                          fontSize: screenHeight * 0.018,
                                          color: Colors.white,
                                          letterSpacing: 0.5),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Image.asset(
                      'images/homescreen.png',
                      height: screenHeight * 0.195,
                      width: screenWidth * 0.411,
                    ),
                  ],
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
