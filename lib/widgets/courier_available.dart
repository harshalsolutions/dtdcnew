import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pick_my_parcel_customer/screens/loading_screen.dart';

import '../util/secondary_button.dart';

class CourierAvailable extends StatelessWidget {
  final String imageAddress;
  final String courierName;
  final String deliveryDuration;
  final String charges;
  final String vid;
  final String packageWeight;
  final String packageValue;
  final String shipmentType;
  final String pickUpPin;
  final String deliveryPin;
  final String packageContent;
  final double packageLength;
  final double packageBreadth;
  final double packageHeight;

  const CourierAvailable({
    required this.courierName,
    required this.imageAddress,
    required this.deliveryDuration,
    required this.charges,
    required this.packageWeight,
    required this.packageValue,
    required this.shipmentType,
    required this.pickUpPin,
    required this.deliveryPin,
    required this.packageContent,
    required this.packageLength,
    required this.packageBreadth,
    required this.packageHeight, required this.vid,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        const Divider(
          thickness: 1.0,
        ),
        SizedBox(
          height: screenHeight * 0.0248,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(imageAddress),
              radius: screenWidth * 0.081,
            ),
            SizedBox(
              width: screenWidth * 0.044,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: screenHeight * 0.0295,
                ),
                Text(
                  courierName,
                  style: TextStyle(
                    fontFamily: 'PT Sans',
                    fontWeight: FontWeight.w800,
                    fontSize: screenHeight * 0.02,
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.0056,
                ),
                Row(
                  children: [
                    Text(
                      'Estimated Delivery Day: ',
                      style: TextStyle(
                          fontFamily: 'PT Sans',
                          fontWeight: FontWeight.w400,
                          fontSize: screenHeight * 0.0158,
                          color: const Color(0xffB3B3B3)),
                    ),
                    Text(
                      deliveryDuration,
                      style: TextStyle(
                        fontFamily: 'PT Sans',
                        fontWeight: FontWeight.w700,
                        fontSize: screenHeight * 0.0158,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.0056,
                ),
                Row(
                  children: [
                    Text(
                      'Charges: ',
                      style: TextStyle(
                          fontFamily: 'PT Sans',
                          fontWeight: FontWeight.w400,
                          fontSize: screenHeight * 0.0158,
                          color: const Color(0xffB3B3B3)),
                    ),
                    Text(
                      charges,
                      style: TextStyle(
                        fontFamily: 'Prompt',
                        fontWeight: FontWeight.w700,
                        fontSize: screenHeight * 0.0158,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.0225,
                ),
                SecondaryButton(
                    onPress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OrderLoadingScreen(
                            deliveryDuration: deliveryDuration,
                            imageAddress: imageAddress,
                            packageValue: packageValue,
                            shipmentType: shipmentType,
                            charges: charges,
                            courierName: courierName,
                            packageWeight: packageWeight,
                            packageHeight: packageHeight,
                            packageLength: packageLength,
                            packageBreadth: packageBreadth,
                            packageContent: packageContent,
                            pickUpPin: pickUpPin,
                            deliveryPin: deliveryPin, vid: vid,
                          ),
                        ),
                      );
                    },
                    label: 'Ship Now'),
                SizedBox(
                  height: screenHeight * 0.0169,
                ),
              ],
            )
          ],
        )
      ],
    );
  }

}
