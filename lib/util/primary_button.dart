import 'package:flutter/material.dart';
import 'package:pick_my_parcel_customer/constants/constants.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback onPress;
  final String label;
  const PrimaryButton({required this.onPress, required this.label});
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: screenHeight * 0.054,
      width: screenWidth * 0.841,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: primaryColor1,
      ),
      child: Center(
        child: GestureDetector(
          onTap: onPress,
          child: Text(
            label,
            style: TextStyle(
                fontFamily: 'Archivo',
                fontSize: screenHeight * 0.02,
                fontWeight: FontWeight.w800,
                color: Colors.white),
          ),
        ),
      ),
    );
  }
}
