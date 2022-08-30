import 'package:flutter/material.dart';
import 'package:pick_my_parcel_customer/widgets/bottom_navigation_bar.dart';
import 'package:pick_my_parcel_customer/widgets/ratings_and_feedback_order_card.dart';
import '../constants/constants.dart';
import '../widgets/app_bar.dart';

class RatingsAndFeedbackScreen extends StatefulWidget {
  const RatingsAndFeedbackScreen({Key? key}) : super(key: key);

  @override
  State<RatingsAndFeedbackScreen> createState() => _RatingsAndFeedbackScreenState();
}

class _RatingsAndFeedbackScreenState extends State<RatingsAndFeedbackScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 0.97),
      appBar:
      CustomAppBar(
        screenHeight: screenHeight,
        screenWidth: screenWidth,
        title: 'My Orders',
        ),
      bottomNavigationBar:
      Container(color: primaryColor2, child: const CustomBottomBar()),
      body: SafeArea(
        child: ListView(
          physics: const ClampingScrollPhysics(),
          children: [
            Stack(children: [
              Container(
                height: screenHeight * 1.1,
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
                    'Previous Orders (3)',
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const RatingsAndFeedbackOrderCard(
                        trackingID: '1735272983',
                        pickupCity: 'New Delhi',
                        deliveryCity: 'Bangalore',
                        pickupPin: '110030',
                        deliveryPin: '560062',
                        orderValue: '₹5234',
                        applicableWeight: '3 Kg'),
                    SizedBox(
                      height: screenHeight * 0.0225,
                    ),
                    const RatingsAndFeedbackOrderCard(
                        trackingID: '7235362863',
                        pickupCity: 'New Delhi',
                        deliveryCity: 'Bangalore',
                        pickupPin: '110030',
                        deliveryPin: '560062',
                        orderValue: '₹5234',
                        applicableWeight: '3 Kg'),
                    SizedBox(
                      height: screenHeight * 0.0225,
                    ),
                    const RatingsAndFeedbackOrderCard(
                        trackingID: '5462463435',
                        pickupCity: 'New Delhi',
                        deliveryCity: 'Bangalore',
                        pickupPin: '110030',
                        deliveryPin: '560062',
                        orderValue: '₹5234',
                        applicableWeight: '3 Kg'),
                  ],
                ),
              ),
            ])
          ],
        ),
      ),
    );
  }
}
