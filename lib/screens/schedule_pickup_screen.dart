import 'dart:developer';

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pick_my_parcel_customer/constants/constants.dart';
import 'package:pick_my_parcel_customer/util/primary_button.dart';
import 'package:pick_my_parcel_customer/widgets/pickup_time_builder.dart';

import '../widgets/app_bar.dart';
import '../widgets/bottom_navigation_bar.dart';
import '../widgets/payment_dialog.dart';

class SchedulePickupScreen extends StatefulWidget {
  final String imageAddress;
  final String courierName;
  final String deliveryDuration;
  final String charges;
  final String vid;
  final String packageWeight;
  final String packageValue;
  final String shipmentType;
  final String pickAddress;
  final String deliveryAddress;
  final String pickUpPin;
  final String deliveryPin;
  final String packageContent;

  final double packageLength;
  final double packageBreadth;
  final double packageHeight;

  const SchedulePickupScreen({Key? key,
    required this.imageAddress,
    required this.courierName,
    required this.deliveryDuration,
    required this.charges,
    required this.packageWeight,
    required this.packageValue,
    required this.shipmentType, required this.pickAddress, required this.deliveryAddress, required this.pickUpPin, required this.deliveryPin, required this.packageContent, required this.packageLength, required this.packageBreadth, required this.packageHeight, required this.vid})
      : super(key: key);

  @override
  State<SchedulePickupScreen> createState() => _SchedulePickupScreenState();
}

class _SchedulePickupScreenState extends State<SchedulePickupScreen> {
  String scheduledDate = DateFormat('d MMM, yyyy').format(DateTime.now());
  List<DateTime?> _singleDatePickerValueWithDefaultValue = [DateTime.now()];

  void dateSelector(newDate) {
    DateTime? _selectedDateTime = newDate[0];
    scheduledDate = _selectedDateTime.toString();
    scheduledDate = DateFormat('d MMM, yyyy').format(_selectedDateTime!);
  }

  @override
  Widget build(BuildContext context) {
    log(widget.deliveryAddress);
    log(widget.pickAddress);
    double screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 0.97),
        appBar: CustomAppBar(
          screenHeight: screenHeight,
          screenWidth: screenWidth,
          title: 'Schedule Pickup',
        ),
        bottomNavigationBar:
        Container(color: primaryColor2, child: const CustomBottomBar()),
        body: SafeArea(
          child: ListView(
            physics: const ClampingScrollPhysics(),
            children: [
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Select Date',
                          style: TextStyle(
                              fontFamily: 'Archivo',
                              fontWeight: FontWeight.w700,
                              fontSize: screenHeight * 0.02,
                              letterSpacing: 0.5),
                        ),
                        SizedBox(
                          height: screenHeight * 0.0056,
                        ),
                        Text(
                          scheduledDate,
                          style: TextStyle(
                              fontFamily: 'Archivo',
                              fontWeight: FontWeight.w700,
                              fontSize: screenHeight * 0.018,
                              color: const Color(0xffA0A0A0),
                              letterSpacing: 0.5),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: screenHeight * 0.09,
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
                  top: screenHeight * 0.047,
                  left: 0.0,
                  right: 0.0,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: screenHeight * 0.02,
                            horizontal: screenWidth * 0.056),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildDefaultSingleDatePickerWithValue(
                                screenHeight, screenWidth),
                            SizedBox(
                              height: screenHeight * 0.02,
                            ),
                            PickupTimeBuilder(
                                screenHeight: screenHeight,
                                screenWidth: screenWidth),
                          ],
                        ),
                      ),
                      PrimaryButton(
                          onPress: () {
                            showPaymentDialog(
                              context: context,
                              imageAddress: widget.imageAddress,
                              courierName: widget.courierName,
                              deliveryDuration: widget.deliveryDuration,
                              charges: widget.charges,
                              packageWeight: double.parse(widget.packageWeight),
                              packageValue: double.parse(widget.packageValue),
                              shipmentType: widget.shipmentType,

                              pickupTime: scheduledDate.toString(),
                              scheduleAdrs: widget.deliveryAddress,
                              pickupAdrs: widget.pickAddress,
                              pickUpPin: widget.pickUpPin,
                              deliveryPin: widget.deliveryPin,
                              packageBreadth: widget.packageBreadth,
                              vid: widget.vid,
                              packageHeight: widget.packageHeight,
                              packageLength: widget.packageLength,
                              packageContent: widget.packageContent,
                            );
                          },
                          label: 'Next')
                    ],
                  ),
                ),
              ])
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDefaultSingleDatePickerWithValue(screenHeight, screenWidth) {
    var config = CalendarDatePicker2Config(
      firstDate: DateTime.now().subtract(const Duration(hours: 24)),
      lastDate: DateTime(2030),
      controlsHeight: screenHeight * 0.112,
      selectedDayHighlightColor: primaryColor1,
      weekdayLabels: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
      weekdayLabelTextStyle: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: screenHeight * 0.02,
        color: const Color(0xffAAAAAA),
      ),
      controlsTextStyle: TextStyle(
        fontFamily: 'Archivo',
        color: primaryColor1,
        fontSize: screenHeight * 0.02,
        fontWeight: FontWeight.w700,
      ),
      dayTextStyle: TextStyle(
        color: Colors.black,
        fontSize: screenHeight * 0.02,
        fontWeight: FontWeight.w600,
      ),
      selectedDayTextStyle: TextStyle(
        color: Colors.white,
        fontSize: screenHeight * 0.02,
        fontWeight: FontWeight.w600,
      ),
    );
    return CalendarDatePicker2(
      config: config,
      initialValue: _singleDatePickerValueWithDefaultValue,
      onValueChanged: (values) =>
          setState(() {
            dateSelector(values);
            _singleDatePickerValueWithDefaultValue = values;
          }),
    );
  }
}
