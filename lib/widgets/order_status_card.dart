import 'package:flutter/material.dart';
import 'package:steps_indicator/steps_indicator.dart';
import '../util/content_cards.dart';

class OrderStatusCard extends StatelessWidget {
  final String date1;
  final String time1;
  final String date2;
  final String time2;
  final String date3;
  final String time3;
  final String date4;
  final String time4;
  final String statusTitle1;
  final String statusLocation1;
  final String statusTitle2;
  final String statusLocation2;
  final String statusTitle3;
  final String statusLocation3;
  final String statusTitle4;
  final String statusLocation4;

  const OrderStatusCard({
    Key? key,
    required this.date1,
    required this.time1,
    required this.date2,
    required this.time2,
    required this.date3,
    required this.time3,
    required this.date4,
    required this.time4,
    required this.statusTitle1,
    required this.statusLocation1,
    required this.statusTitle2,
    required this.statusLocation2,
    required this.statusTitle3,
    required this.statusLocation3,
    required this.statusTitle4,
    required this.statusLocation4,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return ContentCards(
      childWidget: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                date1,
                style: TextStyle(
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w700,
                    fontSize: screenHeight * 0.018),
              ),
              Text(
              time1,
              style: TextStyle(
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w500,
                    fontSize: screenHeight * 0.0135,
                    color: const Color(0xffAFAFAF)),
              ),
              SizedBox(
                height: screenHeight * 0.0767,
              ),
              Text(
                    date2,
                    style: TextStyle(
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w700,
                    fontSize: screenHeight * 0.018),
              ),
              Text(
                time2,
                style: TextStyle(
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w500,
                    fontSize: screenHeight * 0.0135,
                    color: const Color(0xffAFAFAF)),
              ),
              SizedBox(
                height: screenHeight * 0.0767,
              ),
              Text(
                date3,
                style: TextStyle(
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w700,
                    fontSize: screenHeight * 0.018),
              ),
              Text(
                time3,
                style: TextStyle(
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w500,
                    fontSize: screenHeight * 0.0135,
                    color: const Color(0xffAFAFAF)),
              ),
              SizedBox(
                height: screenHeight * 0.0767,
              ),
              Text(
                date4,
                style: TextStyle(
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w700,
                    fontSize: screenHeight * 0.018),
              ),
              Text(
                time4,
                style: TextStyle(
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w500,
                    fontSize: screenHeight * 0.0135,
                    color: const Color(0xffAFAFAF)),
              ),
            ],
          ),
          SizedBox(
            width: screenWidth * 0.046,
          ),
          StepsIndicator(
            selectedStep: 3,
            nbSteps: 4,
            isHorizontal: false,
            selectedStepColorOut: const Color(0xff54DD00),
            selectedStepColorIn: const Color(0xff54DD00),
            doneStepColor: const Color(0xffC4C4C4),
            doneLineColor: const Color(0xffC4C4C4),
            undoneLineColor: const Color(0xffC4C4C4),
            doneStepSize: screenHeight * 0.0225,
            doneLineThickness: screenWidth * 0.0093,
            selectedStepSize: screenHeight * 0.0225,
            unselectedStepSize: screenHeight * 0.0225,
            unselectedStepColorIn: const Color(0xffC4C4C4),
            unselectedStepColorOut: const Color(0xffC4C4C4),
            undoneLineThickness: screenWidth * 0.0093,
            lineLength: screenHeight * 0.09,
          ),
          SizedBox(
            width: screenWidth * 0.046,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                statusTitle1,
                style: TextStyle(
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w700,
                    fontSize: screenHeight * 0.018),
              ),
              Text(
                statusLocation1,
                style: TextStyle(
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w500,
                    fontSize: screenHeight * 0.0135,
                    color: const Color(0xffAFAFAF)),
              ),
              SizedBox(
                height: screenHeight * 0.0767,
              ),
              Text(
                statusTitle2,
                style: TextStyle(
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w700,
                    fontSize: screenHeight * 0.018),
              ),
              Text(
                statusLocation2,
                style: TextStyle(
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w500,
                    fontSize: screenHeight * 0.0135,
                    color: const Color(0xffAFAFAF)),
              ),
              SizedBox(
                height: screenHeight * 0.0767,
              ),
              Text(
                statusTitle3,
                style: TextStyle(
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w700,
                    fontSize: screenHeight * 0.018),
              ),
              Text(
                statusLocation3,
                style: TextStyle(
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w500,
                    fontSize: screenHeight * 0.0135,
                    color: const Color(0xffAFAFAF)),
              ),
              SizedBox(
                height: screenHeight * 0.0767,
              ),
              Text(
                statusTitle4,
                style: TextStyle(
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w700,
                    fontSize: screenHeight * 0.018),
              ),
              Text(
                statusLocation4,
                style: TextStyle(
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w500,
                    fontSize: screenHeight * 0.0135,
                    color: const Color(0xffAFAFAF)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
