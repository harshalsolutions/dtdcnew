import 'dart:convert';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pick_my_parcel_customer/adddata.dart';
import 'package:pick_my_parcel_customer/models/order.dart';
import '../constants/constants.dart';

class OrderDetailsSummaryBox extends StatefulWidget {
  final String applicableWeight;
  final String pickUpPin;
  final String deliveryPin;
  final String packageContent;
  final double packageWeight;
  final double packageLength;
  final double packageBreadth;
  final double packageHeight;
  final double packageValue;
  final String shipmentType;
  final String pickupcity;
  final String deliverycity;
  const OrderDetailsSummaryBox(
      {required this.applicableWeight,
      required this.pickUpPin,
      required this.deliveryPin,
      required this.packageContent,
      required this.packageWeight,
      required this.packageLength,
      required this.packageBreadth,
      required this.packageHeight,
      required this.packageValue,
      required this.shipmentType,
      required this.pickupcity,
      required this.deliverycity});

  @override
  State<OrderDetailsSummaryBox> createState() => _OrderDetailsSummaryBoxState();
}

class _OrderDetailsSummaryBoxState extends State<OrderDetailsSummaryBox> {
  Future<Map<String, dynamic>> fetchPickupCharges() async {
    Map<String, dynamic> pickupPrices = {};
    double weight = double.parse(widget.applicableWeight);
    await FirebaseFirestore.instance
        .collection("Prices")
        .doc(widget.pickupcity.toLowerCase())
        .collection("charges")
        .where("Weight", isGreaterThanOrEqualTo: weight)
        .orderBy("Weight")
        .limit(1)
        .get()
        .then((value) {
      pickupPrices = value.docs.first.data();
    });
    return pickupPrices;
  }

  Future<Map<String, dynamic>> fetchDeliveryCharges() async {
    Map<String, dynamic> pickupPrices = {};

    await FirebaseFirestore.instance
        .collection("Prices")
        .doc(widget.deliverycity.toLowerCase())
        .collection("charges")
        .where("Weight",
            isGreaterThanOrEqualTo: double.parse(widget.applicableWeight))
        .orderBy("Weight")
        .limit(1)
        .get()
        .then((value) {
      pickupPrices = value.docs.first.data();
    });
    return pickupPrices;
  }

  @override
  Widget build(BuildContext context) {
    var travelPrice = double.parse(widget.applicableWeight) * 50;
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Stack(children: [
      Padding(
        padding: const EdgeInsets.only(top: 35.0),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.079),
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
            padding: EdgeInsets.only(
                top: screenHeight * 0.0225,
                bottom: screenHeight * 0.0225,
                right: screenWidth * 0.026,
                left: screenWidth * 0.056),
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 11.0,
                        height: 11.0,
                        decoration: const BoxDecoration(
                          color: primaryColor1,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.046,
                        child: const VerticalDivider(
                          thickness: 3.0,
                          color: Color(0xffFFDCB1),
                          indent: 2.0,
                          endIndent: 2.0,
                        ),
                      ),
                      Container(
                        width: 11.0,
                        height: 11.0,
                        decoration: const BoxDecoration(
                          color: primaryColor1,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.pickupcity,
                        style: TextStyle(
                          fontFamily: 'PT Sans',
                          fontWeight: FontWeight.w400,
                          fontSize: screenHeight * 0.0158,
                        ),
                      ),
                      Text(
                        widget.pickUpPin,
                        style: TextStyle(
                          fontFamily: 'PT Sans',
                          fontWeight: FontWeight.w400,
                          fontSize: screenHeight * 0.0135,
                          color: const Color(0xff929292),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.0214,
                      ),
                      Text(
                        widget.deliverycity,
                        style: TextStyle(
                          fontFamily: 'PT Sans',
                          fontWeight: FontWeight.w400,
                          fontSize: screenHeight * 0.0158,
                        ),
                      ),
                      Text(
                        widget.deliveryPin,
                        style: TextStyle(
                          fontFamily: 'PT Sans',
                          fontWeight: FontWeight.w400,
                          fontSize: screenHeight * 0.0135,
                          color: const Color(0xff929292),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: screenWidth * 0.0854,
                  ),
                  Column(
                    children: [
                      Text(
                        'Order Value',
                        style: TextStyle(
                            fontFamily: 'PT Sans',
                            fontWeight: FontWeight.w400,
                            fontSize: screenHeight * 0.0158,
                            color: const Color(0xffC7C7C7)),
                      ),
                      SizedBox(
                        height: screenHeight * 0.0112,
                      ),
                      Container(
                          alignment: Alignment.center,
                          width: 70.0,
                          child: FutureBuilder<Map<String, dynamic>>(
                              future: fetchPickupCharges(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<Map<String, dynamic>>
                                      snapshot) {
                                if (snapshot.hasData) {
                                  var pickupPrice =
                                      snapshot.data!["pickupPrice"];
                                  return FutureBuilder<Map<String, dynamic>>(
                                      future: fetchPickupCharges(),
                                      builder: (BuildContext context,
                                          AsyncSnapshot<Map<String, dynamic>>
                                              snapshot1) {
                                        if (snapshot1.hasData) {
                                          var totalPrice =
                                              snapshot1.data!["pickupPrice"] +
                                                  pickupPrice +
                                                  travelPrice;
                                          return Text(
                                            totalPrice.toString(),
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontFamily: 'Prompt SemiBold',
                                              fontWeight: FontWeight.w600,
                                              fontSize: screenHeight * 0.0158,
                                            ),
                                          );
                                        }
                                        return const Text("Error  prices");
                                      });
                                }
                                return const Text("Error tching prices");
                              })),
                      SizedBox(
                        height: screenHeight * 0.0442,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 78.0,
                    child: VerticalDivider(
                      width: screenWidth * 0.0455,
                      thickness: 1.0,
                      color: const Color(0xffECECEC),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        'Applicable Weight',
                        style: TextStyle(
                            fontFamily: 'PT Sans',
                            fontWeight: FontWeight.w400,
                            fontSize: screenHeight * 0.0158,
                            color: const Color(0xffC7C7C7)),
                      ),
                      SizedBox(
                        height: screenHeight * 0.0112,
                      ),
                      Text(
                        widget.applicableWeight + ' Kg',
                        style: TextStyle(
                          fontFamily: 'Prompt SemiBold',
                          fontWeight: FontWeight.w600,
                          fontSize: screenHeight * 0.0158,
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.0442,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      Positioned(
        child: SizedBox(
          width: screenWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 40.0,
                width: 40.0,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(screenHeight * 0.02357),
                    boxShadow: const [
                      BoxShadow(
                          color: Color(0xffEEEEEE),
                          blurRadius: 5.0,
                          spreadRadius: 1.0,
                          offset: Offset(-0.0, -3.0))
                    ]),
                padding: const EdgeInsets.all(5),
                child: const Image(
                  image: AssetImage('images/pin.png'),
                ),
              ),
              Container(
                height: 40.0,
                width: 40.0,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(screenHeight * 0.02357),
                    boxShadow: const [
                      BoxShadow(
                          color: Color(0xffEEEEEE),
                          blurRadius: 5.0,
                          spreadRadius: 1.0,
                          offset: Offset(-0.0, -3.0))
                    ]),
                padding: const EdgeInsets.all(5),
                child: const Image(
                  image: AssetImage('images/rupee.png'),
                ),
              ),
              Container(
                height: 40.0,
                width: 40.0,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(screenHeight * 0.02357),
                    boxShadow: const [
                      BoxShadow(
                          color: Color(0xffEEEEEE),
                          blurRadius: 5.0,
                          spreadRadius: 1.0,
                          offset: Offset(-0.0, -3.0))
                    ]),
                padding: const EdgeInsets.all(5),
                child: const Image(
                  image: AssetImage('images/archive.png'),
                ),
              ),
            ],
          ),
        ),
      )
    ]);
  }
}
