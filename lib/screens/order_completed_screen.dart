import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pick_my_parcel_customer/widgets/bottom_navigation_bar.dart';
import 'package:pick_my_parcel_customer/widgets/primary_order_track_card.dart';
import 'package:provider/provider.dart';

import '../constants/constants.dart';
import '../providers/order_provider.dart';
import '../widgets/app_bar.dart';

class OrderCompletedScreen extends StatefulWidget {
  const OrderCompletedScreen({
    Key? key,
  }) : super(key: key);

  @override
  _OrderCompletedScreenState createState() => _OrderCompletedScreenState();
}

class _OrderCompletedScreenState extends State<OrderCompletedScreen> {
  late OrderProvider orderProvider;

  @override
  void initState() {
    orderProvider = Provider.of<OrderProvider>(context, listen: false);
    orderProvider.fetchCompletedOrderList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    orderProvider = Provider.of(context);

    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 0.97),
      appBar: CustomAppBar(
        screenHeight: screenHeight,
        screenWidth: screenWidth,
        title: 'Your Completed Order',
      ),
      bottomNavigationBar:
          Container(color: primaryColor2, child: const CustomBottomBar()),
      body: SafeArea(
        child: ListView(
          physics: const ClampingScrollPhysics(),
          children: [
            SizedBox(
              height: screenHeight * 0.027,
            ),
            Stack(children: [
              Container(
                height: screenHeight * 0.85,
                width: screenWidth,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(screenHeight * 0.0338),
                      topRight: Radius.circular(screenHeight * 0.0338),
                    ),
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.03),
                          offset: Offset(0.0, -15.0),
                          spreadRadius: 0.0,
                          blurRadius: 40.0)
                    ]),
                child: Padding(
                  padding: EdgeInsets.only(
                      top: screenHeight * 0.0225, left: screenWidth * 0.079),
                  child: Text(
                    'Completed Orders (${orderProvider.completedOrderList.length})',
                    style: TextStyle(
                        fontFamily: 'Archivo',
                        fontWeight: FontWeight.w700,
                        fontSize: screenHeight * 0.0225,
                        letterSpacing: 0.5),
                  ),
                ),
              ),
              Positioned(
                top: screenHeight * 0.135,
                left: 0.0,
                right: 0.0,
                child: Container(
                  height: screenHeight,
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
              ),
              Positioned(
                  top: screenHeight * 0.067,
                  left: 0.0,
                  right: 0.0,
                  child: SizedBox(
                    height: screenHeight,
                    child: ListView.builder(
                        itemCount: orderProvider.completedOrderList.length,
                        itemBuilder: (context, index) {
                          log(orderProvider.getCompletedOrderList.length
                              .toString());
                          return Container(
                            margin: EdgeInsets.only(top: 11),
                            child: PrimaryOrderTrackCard(
                                trackingID: orderProvider
                                    .completedOrderList[index].trackingId,
                                pickupCity: orderProvider
                                    .completedOrderList[index].pickupAdrs,
                                deliveryCity: orderProvider
                                    .completedOrderList[index].deliveryAdrs,
                                pickupPin: orderProvider
                                    .completedOrderList[index].pickupPin,
                                deliveryPin: orderProvider
                                    .completedOrderList[index].deliveryPin),
                          );
                        }),
                  )

                  /*Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     PrimaryOrderTrackCard(
                        trackingID: '1735272983',
                        pickupCity: 'New Delhi',
                        deliveryCity: 'Bangalore',
                        pickupPin: '110030',
                        deliveryPin: '560062'),
                    */ /*SizedBox(
                      height: screenHeight * 0.0338,
                    ),

                    SizedBox(
                      height: screenHeight * 0.0225,
                    ),
                    const PrimaryOrderTrackCard(
                        trackingID: '7235362863',
                        pickupCity: 'New Delhi',
                        deliveryCity: 'Bangalore',
                        pickupPin: '110030',
                        deliveryPin: '560062'),
                    SizedBox(
                      height: screenHeight * 0.0338,
                    ),
                    const PrimaryOrderTrackCard(
                        trackingID: '5462463435',
                        pickupCity: 'New Delhi',
                        deliveryCity: 'Bangalore',
                        pickupPin: '110030',
                        deliveryPin: '560062'),*/ /*
                  ],
                ),*/
                  ),
            ])
          ],
        ),
      ),
    );
  }
}
