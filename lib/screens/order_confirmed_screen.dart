import 'package:flutter/material.dart';
import 'dart:math';
import 'package:pick_my_parcel_customer/util/call_us_button.dart';
import 'package:pick_my_parcel_customer/util/primary_button.dart';
import 'package:pick_my_parcel_customer/widgets/confirmation_details.dart';
import '../constants/constants.dart';
import '../util/content_cards.dart';
import '../widgets/app_bar.dart';
import '../widgets/bottom_navigation_bar.dart';

class OrderConfirmedScreen extends StatelessWidget {
  final String imageAddress;
  final String courierName;
  final String deliveryDuration;
  final String charges;
  final String packageWeight;
  final String packageValue;
  final String shipmentType;
  const OrderConfirmedScreen({Key? key, required this.imageAddress, required this.courierName, required this.deliveryDuration, required this.charges, required this.packageWeight, required this.packageValue, required this.shipmentType}) : super(key: key);

  String trackingIDGenerator() {
    double trackingID = Random().nextDouble() * 10000000000;
    return trackingID.toStringAsFixed(0);
  }
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:
      CustomAppBar(
        screenHeight: screenHeight,
        screenWidth: screenWidth,
        title: 'Order Confirmed',),
      bottomNavigationBar:
          Container(color: primaryColor2, child: const CustomBottomBar()),
      body: SafeArea(
        child: ListView(
            physics: const ClampingScrollPhysics(),
            children: [
          Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: screenHeight * 0.0225,
                  ),
                  ContentCards(
                    childWidget: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Tracking ID: ',
                          style: TextStyle(
                            fontFamily: 'Archivo',
                            fontWeight: FontWeight.w400,
                            fontSize: screenHeight * 0.0225,
                          ),
                        ),
                        Text(
                          trackingIDGenerator(),
                          style: TextStyle(
                            fontFamily: 'Archivo',
                            fontWeight: FontWeight.w700,
                            fontSize: screenHeight * 0.0225,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.15,
                  ),
                  Container(
                    height: screenHeight * 0.55,
                    decoration: BoxDecoration(
                        color: primaryColor2,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(screenHeight * 0.0564),
                          topRight: Radius.circular(screenHeight * 0.0564),
                        ),
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.03),
                              spreadRadius: 5.0,
                              blurRadius: 5.0)
                        ]),
                  ),
                ],
              ),
              Positioned(
                top: screenHeight * 0.125,
                left: 0.0,
                right: 0.0,
                child: Column(children: [
                   ConfirmationDetailsCard(
                      courierName: courierName,
                      imageAddress: imageAddress,
                      deliveryDuration: deliveryDuration,
                      charges: charges,
                      packageWeight: packageWeight,
                      packageValue: packageValue,
                      shipmentType: shipmentType,
                      delivered: false,),
                  SizedBox(
                    height: screenHeight * 0.034,
                  ),
                  const CallUsButton(),
                  SizedBox(
                    height: screenHeight * 0.045,
                  ),
                  PrimaryButton(
                      onPress: () async {
                    Navigator.pushNamed(context, '/thirteenth');
                    // await UserSimplePreferences.setPackageWeight(packageWeight);
                  },
                      label: 'Go To My Orders')
                ]),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
