import 'package:flutter/material.dart';
import 'package:pick_my_parcel_customer/widgets/ratings_dialog.dart';
import 'package:steps_indicator/steps_indicator.dart';
import '../constants/constants.dart';
import '../screens/view_individual_order_screen.dart';
import '../util/content_card_2.dart';

class RatingsAndFeedbackOrderCard extends StatelessWidget {
  final String trackingID;
  final String pickupCity;
  final String pickupPin;
  final String deliveryCity;
  final String deliveryPin;
  final String orderValue;
  final String applicableWeight;
  const RatingsAndFeedbackOrderCard(
      {Key? key,
        required this.trackingID,
        required this.pickupCity,
        required this.deliveryCity,
        required this.pickupPin,
        required this.deliveryPin,
        required this.orderValue,
        required this.applicableWeight})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return ContentCards2(
      childWidget: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.0225, left: screenWidth * 0.0233, right: screenWidth * 0.0233),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Tracking ID: ',
                        style: TextStyle(
                          fontFamily: 'Archivo',
                          fontWeight: FontWeight.w500,
                          fontSize: screenHeight * 0.0225,
                        ),
                      ),
                      Text(
                        trackingID,
                        style: TextStyle(
                          fontFamily: 'Archivo',
                          fontWeight: FontWeight.w700,
                          fontSize: screenHeight * 0.0225,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * 0.029,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        pickupCity,
                        style: TextStyle(
                          fontFamily: 'Archivo',
                          fontWeight: FontWeight.w400,
                          fontSize: screenHeight * 0.0158,
                        ),
                      ),
                      Text(
                        deliveryCity,
                        style: TextStyle(
                          fontFamily: 'Archivo',
                          fontWeight: FontWeight.w400,
                          fontSize: screenHeight * 0.0158,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * 0.0056,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        pickupPin,
                        style: TextStyle(
                            fontFamily: 'Archivo',
                            fontWeight: FontWeight.w400,
                            fontSize: screenHeight * 0.0135,
                            color: const Color(0xffB8B8B8)),
                      ),
                      Text(
                        deliveryPin,
                        style: TextStyle(
                            fontFamily: 'Archivo',
                            fontWeight: FontWeight.w400,
                            fontSize: screenHeight * 0.0135,
                            color: const Color(0xffB8B8B8)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * 0.0056,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 20.0,
                        height: 20.0,
                        decoration: const BoxDecoration(
                          color: primaryColor1,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3.0),
                        child: StepsIndicator(
                          selectedStep: 2,
                          nbSteps: 2,
                          selectedStepColorIn: primaryColor1,
                          selectedStepColorOut: primaryColor1,
                          doneLineColor: primaryColor3,
                          undoneLineColor: const Color(0xffF1F1F1),
                          doneStepSize: 0.0,
                          doneLineThickness: screenWidth * 0.0093,
                          unselectedStepSize: 0,
                          undoneLineThickness: screenWidth * 0.0093,
                          lineLength: screenWidth * 0.64,
                        ),
                      ),
                      Container(
                        width: 20.0,
                        height: 20.0,
                        decoration: const BoxDecoration(
                          color: primaryColor1,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Order Value',
                        style: TextStyle(
                          fontFamily: 'Archivo',
                          fontWeight: FontWeight.w400,
                          fontSize: screenHeight * 0.0158,
                        ),
                      ),
                      Text(
                        orderValue,
                        style: TextStyle(
                          fontFamily: 'Archivo',
                          fontWeight: FontWeight.w700,
                          fontSize: screenHeight * 0.0158,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Applicable Weight',
                        style: TextStyle(
                          fontFamily: 'Archivo',
                          fontWeight: FontWeight.w400,
                          fontSize: screenHeight * 0.0158,
                        ),
                      ),
                      Text(
                        applicableWeight,
                        style: TextStyle(
                          fontFamily: 'Archivo',
                          fontWeight: FontWeight.w700,
                          fontSize: screenHeight * 0.0158,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  )
                ],
              ),
            ),
            const Divider(
              color: primaryColor1,
              thickness: 1.0,
              height: 0.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.0467, vertical: screenHeight * 0.017),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      showRatingsDialog(context);
                    },
                    child: Row(
                      children: [
                        Text(
                          'Rating & Feedback',
                          style: TextStyle(
                              fontFamily: 'Archivo',
                              fontWeight: FontWeight.w400,
                              fontSize: screenHeight * 0.0135,
                              color: primaryColor1
                          ),
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: primaryColor1,
                          size: 10.0,
                        )
                      ],
                    ),
                  ),
                  Text(
                    'Order Completed',
                    style: TextStyle(
                        fontFamily: 'Archivo',
                        fontWeight: FontWeight.w400,
                        fontSize: screenHeight * 0.0135,
                    ),
                  ),
                ],
              ),
            ),

          ]),
    );
  }
}


openIndividualOrderScreen(context, trackingID, pickupCity, deliveryCity, pickupPin, deliveryPin, orderValue, applicableWeight, deliveryStatus) {
  Navigator.push(context, MaterialPageRoute(
    builder: (context) => ViewIndividualOrderScreen(
        trackingID: trackingID,
        deliveryPin: deliveryPin,
        pickupCity: pickupCity,
        deliveryCity: deliveryCity,
        pickupPin: pickupPin,
        orderValue: orderValue,
        applicableWeight: applicableWeight,
      delivered: deliveryStatus,
    ),
  ),
  );
}