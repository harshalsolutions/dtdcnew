import 'package:flutter/material.dart';

class ContentCards extends StatelessWidget {
  final Widget childWidget;

  const ContentCards({Key? key, required this.childWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.079),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
            boxShadow: const [
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
          padding: EdgeInsets.symmetric(
              vertical: screenHeight * 0.0225, horizontal: screenWidth * 0.046),
          child: childWidget,
        ),
      ),
    );
  }
}
