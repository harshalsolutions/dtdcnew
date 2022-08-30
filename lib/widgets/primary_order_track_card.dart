import 'package:flutter/material.dart';
import 'package:steps_indicator/steps_indicator.dart';
import '../constants/constants.dart';
import '../screens/track_individual_courier_screen.dart';
import '../util/content_cards.dart';

class PrimaryOrderTrackCard extends StatelessWidget {
  final String trackingID;
  final String pickupCity;
  final String pickupPin;
  final String deliveryCity;
  final String deliveryPin;
  const PrimaryOrderTrackCard(
      {Key? key,
      required this.trackingID,
      required this.pickupCity,
      required this.deliveryCity,
      required this.pickupPin,
      required this.deliveryPin})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        openIndividualTrackScreen(context, trackingID, pickupCity, deliveryCity, pickupPin, deliveryPin);
      },
      child: ContentCards(
        childWidget: Column(children: [
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
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.023),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      pickupCity,
                      style: TextStyle(
                        fontFamily: 'Archivo',
                        fontWeight: FontWeight.w400,
                        fontSize: screenHeight * 0.018,
                      ),
                    ),
                    Text(
                      deliveryCity,
                      style: TextStyle(
                        fontFamily: 'Archivo',
                        fontWeight: FontWeight.w400,
                        fontSize: screenHeight * 0.018,
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
                          fontSize: screenHeight * 0.0158,
                          color: const Color(0xffB8B8B8)),
                    ),
                    Text(
                      deliveryPin,
                      style: TextStyle(
                          fontFamily: 'Archivo',
                          fontWeight: FontWeight.w400,
                          fontSize: screenHeight * 0.0158,
                          color: const Color(0xffB8B8B8)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 15.0,
                height: 15.0,
                decoration: const BoxDecoration(
                  color: primaryColor1,
                  shape: BoxShape.circle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3.0),
                child: StepsIndicator(
                  selectedStep: 0,
                  nbSteps: 4,
                  selectedStepColorIn: primaryColor1,
                  selectedStepColorOut: primaryColor1,
                  doneLineColor: const Color(0xffF1F1F1),
                  undoneLineColor: const Color(0xffF1F1F1),
                  doneStepSize: 0.0,
                  doneLineThickness: screenWidth * 0.0093,
                  unselectedStepSize: 0,
                  undoneLineThickness: screenWidth * 0.0093,
                  lineLength: screenWidth * 0.16,
                  selectedStepWidget: ClipOval(
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      color: primaryColor1,
                      height: 40.0,
                      width: 40.0,
                      child: Image.asset(
                        'images/delivery-box.png',
                        color: Colors.white,
                        width: 10,
                        height: 10,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: 15.0,
                height: 15.0,
                decoration: const BoxDecoration(
                  color: primaryColor1,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}

openIndividualTrackScreen(context, trackingID, pickupCity, deliveryCity, pickupPin, deliveryPin) {
  Navigator.push(context, MaterialPageRoute(
    builder: (context) => TrackIndividualCourierScreen(
      trackingID: trackingID,
      deliveryPin: deliveryPin,
      pickupCity: pickupCity,
      deliveryCity: deliveryCity,
      pickupPin: pickupPin,
    ),
  ),
  );
}