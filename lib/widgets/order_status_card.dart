import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:steps_indicator/steps_indicator.dart';
import '../util/content_cards.dart';

class OrderStatusCard extends StatefulWidget {
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
  final String trackingID;
  const OrderStatusCard(
      {Key? key,
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
      required this.trackingID})
      : super(key: key);

  @override
  State<OrderStatusCard> createState() => _OrderStatusCardState();
}

class _OrderStatusCardState extends State<OrderStatusCard> {
  String? status;
  int steps = 0;
  Future<void> getStatus() async {
    await FirebaseFirestore.instance
        .collection("Orders")
        .doc(widget.trackingID)
        .get()
        .then((value) {
      try {
        setState(() {
          status = value.data()!["orderStatus"];
          if (status == "accepted") {
            steps = 1;
          } else if (status == "picked") {
            steps = 2;
          } else if (status == "dispatched") {
            steps = 3;
          } else if (status == "complete") {
            steps = 4;
          }
        });
      } on FirebaseException catch (e) {
        setState(() {
          status = 'error';
        });
        print(e.message);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getStatus();
  }

  @override
  Widget build(BuildContext context) {
    print("aaa" + status.toString());
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return ContentCards(
      childWidget: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                height: screenHeight * 0.0214,
              ),
              Text(
                widget.date1,
                style: TextStyle(
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w700,
                    fontSize: screenHeight * 0.018),
              ),
              Text(
                widget.time1,
                style: TextStyle(
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w500,
                    fontSize: screenHeight * 0.0135,
                    color: const Color(0xffAFAFAF)),
              ),
              SizedBox(
                height: screenHeight * 0.0827,
              ),
              Text(
                widget.date2,
                style: TextStyle(
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w700,
                    fontSize: screenHeight * 0.018),
              ),
              Text(
                widget.time2,
                style: TextStyle(
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w500,
                    fontSize: screenHeight * 0.0135,
                    color: const Color(0xffAFAFAF)),
              ),
              SizedBox(
                height: screenHeight * 0.0827,
              ),
              Text(
                widget.date3,
                style: TextStyle(
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w700,
                    fontSize: screenHeight * 0.018),
              ),
              Text(
                widget.time3,
                style: TextStyle(
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w500,
                    fontSize: screenHeight * 0.0135,
                    color: const Color(0xffAFAFAF)),
              ),
              SizedBox(
                height: screenHeight * 0.0827,
              ),
              Text(
                widget.date4,
                style: TextStyle(
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w700,
                    fontSize: screenHeight * 0.018),
              ),
              Text(
                widget.time4,
                style: TextStyle(
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w500,
                    fontSize: screenHeight * 0.0135,
                    color: const Color(0xffAFAFAF)),
              ),
              SizedBox(
                height: screenHeight * 0.0827,
              ),
              Text(
                widget.date4,
                style: TextStyle(
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w700,
                    fontSize: screenHeight * 0.018),
              ),
              Text(
                widget.time4,
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
            selectedStep: steps,
            nbSteps: 5,
            isHorizontal: false,
            selectedStepColorOut: const Color(0xff54DD00),
            selectedStepColorIn: const Color(0xff54DD00),
            doneStepColor: const Color(0xff54DD00),
            doneLineColor: const Color(0xff54DD00),
            undoneLineColor: const Color(0xffC4C4C4),
            doneStepSize: screenHeight * 0.0225,
            doneLineThickness: screenWidth * 0.0093,
            selectedStepSize: screenHeight * 0.0225,
            unselectedStepSize: screenHeight * 0.0225,
            unselectedStepColorIn: const Color(0xffC4C4C4),
            unselectedStepColorOut: const Color(0xffC4C4C4),
            undoneLineThickness: screenWidth * 0.0093,
            lineLength: screenHeight * 0.088,
          ),
          SizedBox(
            width: screenWidth * 0.046,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Placed",
                style: TextStyle(
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w700,
                    fontSize: screenHeight * 0.018),
              ),
              Text(
                widget.statusLocation1,
                style: TextStyle(
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w500,
                    fontSize: screenHeight * 0.0135,
                    color: const Color(0xffAFAFAF)),
              ),
              SizedBox(
                height: screenHeight * 0.0827,
              ),
              Text(
                "Accepted",
                style: TextStyle(
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w700,
                    fontSize: screenHeight * 0.018),
              ),
              SizedBox(
                height: screenHeight * 0.0827,
              ),
              Text(
                "Picked Up",
                style: TextStyle(
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w700,
                    fontSize: screenHeight * 0.018),
              ),
              Text(
                widget.statusLocation2,
                style: TextStyle(
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w500,
                    fontSize: screenHeight * 0.0135,
                    color: const Color(0xffAFAFAF)),
              ),
              SizedBox(
                height: screenHeight * 0.0827,
              ),
              Text(
                "Dispatched",
                style: TextStyle(
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w700,
                    fontSize: screenHeight * 0.018),
              ),
              Text(
                "Pune",
                style: TextStyle(
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w500,
                    fontSize: screenHeight * 0.0135,
                    color: const Color(0xffAFAFAF)),
              ),
              SizedBox(
                height: screenHeight * 0.0827,
              ),
              Text(
                "Delivered",
                style: TextStyle(
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w700,
                    fontSize: screenHeight * 0.018),
              ),
              Text(
                widget.statusLocation4,
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
