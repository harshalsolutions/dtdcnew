import 'package:flutter/material.dart';

import '../constants/constants.dart';

class CallUsButton extends StatelessWidget {
  const CallUsButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: screenWidth * 0.69,
          height: screenHeight * 0.06,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                bottomLeft: Radius.circular(10.0),
              ),
              boxShadow: [
                BoxShadow(
                  offset: Offset(-10.0, 10.0),
                  blurRadius: 30.0,
                  color: Color.fromRGBO(0, 0, 0, 0.05),
                ),
                BoxShadow(
                  offset: Offset(10.0, -10.0),
                  blurRadius: 30.0,
                  color: Color.fromRGBO(0, 0, 0, 0.04),
                ),
              ]),
          child: Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.046),
            child: Row(
              children: [
                Text(
                  'Call Us: ',
                  style: TextStyle(
                    fontFamily: 'Archivo',
                    fontWeight: FontWeight.w400,
                    fontSize: screenHeight * 0.0225,
                  ),
                ),
                Text(
                  '1800373562',
                  style: TextStyle(
                    fontFamily: 'Archivo',
                    fontWeight: FontWeight.w700,
                    fontSize: screenHeight * 0.0225,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
            width: screenWidth * 0.14,
            height: screenHeight * 0.06,
            decoration: const BoxDecoration(
                color: primaryColor1,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(-10.0, 10.0),
                    blurRadius: 30.0,
                    color: Color.fromRGBO(0, 0, 0, 0.05),
                  ),
                  BoxShadow(
                    offset: Offset(10.0, -10.0),
                    blurRadius: 30.0,
                    color: Color.fromRGBO(0, 0, 0, 0.04),
                  ),
                ]),
            child: const Center(
              child: Icon(
                Icons.call,
                size: 28.0,
                color: Colors.white,
              ),
            )),
      ],
    );
  }
}
