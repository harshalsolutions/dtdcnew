import 'package:flutter/material.dart';

import '../constants/constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    required this.screenHeight,
    required this.screenWidth,
    required this.title,
  }) : super(key: key);

  final double screenHeight;
  final double screenWidth;
  final String title;

  @override
  Size get preferredSize => Size.fromHeight(screenHeight * 0.099);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: primaryColor1,
      elevation: 0.0,
      toolbarHeight: screenHeight * 0.1,
      automaticallyImplyLeading: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      flexibleSpace: Padding(
        padding: const EdgeInsets.only(left: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30.0,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_rounded,
                color: Colors.black,
                size: screenWidth * 0.057,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.011,
            ),
            Text(
              title,
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontFamily: 'Montserrat SemiBold',
                  fontWeight: FontWeight.w800,
                  fontSize: screenHeight * 0.0225,
                  color: Colors.black
              ),
            ),
          ],
        ),
      ),
    );
  }
}
