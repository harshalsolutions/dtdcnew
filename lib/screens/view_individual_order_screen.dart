import 'package:flutter/material.dart';
import 'package:pick_my_parcel_customer/util/call_us_button.dart';
import 'package:pick_my_parcel_customer/widgets/confirmation_details.dart';
import 'package:pick_my_parcel_customer/widgets/individual_order_card.dart';
import '../constants/constants.dart';
import '../widgets/app_bar.dart';
import '../widgets/bottom_navigation_bar.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ViewIndividualOrderScreen extends StatefulWidget {
  final String trackingID;
  final String pickupCity;
  final String deliveryCity;
  final String pickupPin;
  final String deliveryPin;
  final String orderValue;
  final String applicableWeight;
  final bool delivered;
  const ViewIndividualOrderScreen({Key? key, required this.trackingID, required this.pickupCity, required this.deliveryCity, required this.pickupPin, required this.deliveryPin, required this.orderValue, required this.applicableWeight, required this.delivered}) : super(key: key);

  @override
  State<ViewIndividualOrderScreen> createState() =>
      _ViewIndividualOrderScreenState();
}

class _ViewIndividualOrderScreenState
    extends State<ViewIndividualOrderScreen> {
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
        title: 'My Orders',),
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
                ]),
                Positioned(
                  top: screenHeight * 0.022,
                  left: 0.0,
                  right: 0.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IndividualOrderCard(
                          trackingID: widget.trackingID,
                          pickupCity: widget.pickupCity,
                          deliveryCity: widget.deliveryCity,
                          pickupPin: widget.pickupPin,
                          deliveryPin: widget.deliveryPin,
                          applicableWeight: widget.applicableWeight,
                          orderValue: widget.orderValue,
                        delivered: widget.delivered,
                      ),
                      SizedBox(
                        height: screenHeight * 0.0338,
                      ),
                      ConfirmationDetailsCard(
                          courierName: 'DHL International',
                          imageAddress: 'images/DHL Icon.png',
                          deliveryDuration: '6 Days',
                          charges: '200 Rs.',
                          packageWeight: widget.applicableWeight,
                          packageValue: widget.orderValue,
                          shipmentType: 'Domestic',
                        delivered: widget.delivered,),
                      SizedBox(
                        height: screenHeight * 0.0338,
                      ),
                      const CallUsButton(),
                      SizedBox(
                        height: screenHeight * 0.0338,
                      ),
                  Container(
                    alignment: Alignment.center,
                    child: CircularPercentIndicator(
                      radius: screenHeight * 0.098,
                      lineWidth: 12.0,
                      percent: 0.0,
                      center: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Status",
                            style: TextStyle(
                            fontFamily: 'Archivo',
                            fontSize: screenHeight * 0.02,
                            fontWeight: FontWeight.w500
                          ),),
                          Text(
                            widget.delivered == true
                            ? 'Delivered' : 'Dispatched',
                            style: TextStyle(
                                fontFamily: 'Archivo',
                                fontSize: screenHeight * 0.02,
                                fontWeight: FontWeight.w700
                            ),),
                        ],
                      ),
                      progressColor: primaryColor1,
                      backgroundColor: const Color(0xffE9E9E9),
                      animation: true,
                    )
                  ),
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
