import 'package:flutter/material.dart';
import 'package:pick_my_parcel_customer/util/call_us_button.dart';
import '../constants/constants.dart';
import '../widgets/app_bar.dart';
import '../widgets/bottom_navigation_bar.dart';
import '../widgets/order_status_card.dart';
import '../widgets/primary_order_track_card.dart';

class TrackIndividualCourierScreen extends StatefulWidget {
  final String trackingID;
  final String pickupCity;
  final String deliveryCity;
  final String pickupPin;
  final String deliveryPin;
  const TrackIndividualCourierScreen({Key? key, required this.trackingID, required this.pickupCity, required this.deliveryCity, required this.pickupPin, required this.deliveryPin}) : super(key: key);

  @override
  State<TrackIndividualCourierScreen> createState() =>
      _TrackIndividualCourierScreenState();
}

class _TrackIndividualCourierScreenState
    extends State<TrackIndividualCourierScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    String trackStatus = 'Dispatched';
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:
      CustomAppBar(
        screenHeight: screenHeight,
        screenWidth: screenWidth,
        title: 'Track Your Courier',),
      bottomNavigationBar:
          Container(color: primaryColor2, child: const CustomBottomBar()),
      body: SafeArea(
        child: ListView(
          physics: const ClampingScrollPhysics(),
          children: [
            Stack(
              children: [
                Column(children: [
                  SizedBox(
                    height: screenHeight * 0.135,
                  ),
                  Container(
                    height: screenHeight * 0.8,
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
                ]),
                Positioned(
                  top: screenHeight * 0.022,
                  left: 0.0,
                  right: 0.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PrimaryOrderTrackCard(
                          trackingID: widget.trackingID,
                          pickupCity: widget.pickupCity,
                          deliveryCity: widget.deliveryCity,
                          pickupPin: widget.pickupPin,
                          deliveryPin: widget.deliveryPin),
                      SizedBox(
                        height: screenHeight * 0.0338,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: screenWidth * 0.079),
                        child: Row(
                          children: [
                            Text(
                              'Status: ',
                              style: TextStyle(
                                fontFamily: 'Archivo',
                                fontWeight: FontWeight.w500,
                                fontSize: screenHeight * 0.02,
                              ),
                            ),
                            Text(
                              trackStatus,
                              style: TextStyle(
                                fontFamily: 'Archivo',
                                fontWeight: FontWeight.w700,
                                fontSize: screenHeight * 0.02,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.0225,
                      ),
                      const OrderStatusCard(
                          date1: '07 May, 2022',
                          time1: '10:07 AM',
                          date2: '08 May, 2022',
                          time2: '11:30 PM',
                          date3: '10 May, 2022',
                          time3: '',
                          date4: '11 May, 2022',
                          time4: '',
                          statusTitle1: 'Pick-Up',
                          statusLocation1: 'New Delhi, Delhi',
                          statusTitle2: 'Dispatched',
                          statusLocation2: 'New Delhi, Delhi',
                          statusTitle3: 'Arrived to Pune',
                          statusLocation3: 'Bangalore, Karnataka',
                          statusTitle4: 'Delivered',
                          statusLocation4: 'Bangalore, Karnataka'),
                      SizedBox(
                        height: screenHeight * 0.0338,
                      ),
                      const CallUsButton()
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
