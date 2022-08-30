import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pick_my_parcel_customer/widgets/bottom_navigation_bar.dart';
import 'package:pick_my_parcel_customer/widgets/primary_order_track_card.dart';

import '../constants/constants.dart';
import '../widgets/app_bar.dart';

class TrackYourCourierScreen extends StatefulWidget {
  const TrackYourCourierScreen({
    Key? key,
  }) : super(key: key);

  @override
  _TrackYourCourierScreenState createState() => _TrackYourCourierScreenState();
}

class _TrackYourCourierScreenState extends State<TrackYourCourierScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    var args = ModalRoute.of(context)!.settings.arguments as Map;
    log(args.toString());

    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 0.97),
      appBar: CustomAppBar(
        screenHeight: screenHeight,
        screenWidth: screenWidth,
        title: 'Track Your Courier',
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
                    'Current Orders (1)',
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
                        itemCount: args.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(top: 11),
                            child: PrimaryOrderTrackCard(
                                trackingID: args.length.toString(),
                                pickupCity: 'New Delhi',
                                deliveryCity: 'Bangalore',
                                pickupPin: '110030',
                                deliveryPin: '560062'),
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
