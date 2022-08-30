import 'package:flutter/material.dart';
import 'package:pick_my_parcel_customer/screens/schedule_pickup_screen.dart';
import 'package:pick_my_parcel_customer/util/primary_button.dart';
import 'package:pick_my_parcel_customer/widgets/address_input_box.dart';

import '../constants/constants.dart';
import '../util/content_cards.dart';
import '../widgets/app_bar.dart';
import '../widgets/bottom_navigation_bar.dart';

class AddressDetailsScreen extends StatefulWidget {
  final String imageAddress;
  final String courierName;
  final String deliveryDuration;
  final String charges;
  final String vid;
  final String packageWeight;
  final String packageValue;
  final String shipmentType;
  final String pickUpPin;
  final String deliveryPin;
  final String packageContent;

  final double packageLength;
  final double packageBreadth;
  final double packageHeight;

  const AddressDetailsScreen(
      {Key? key,
      required this.imageAddress,
      required this.courierName,
      required this.deliveryDuration,
      required this.charges,
      required this.packageWeight,
      required this.packageValue,
      required this.shipmentType,
      required this.pickUpPin,
      required this.deliveryPin,
      required this.packageContent,
      required this.packageLength,
      required this.packageBreadth,
      required this.packageHeight, required this.vid})
      : super(key: key);

  @override
  _AddressDetailsScreenState createState() => _AddressDetailsScreenState();
}

class _AddressDetailsScreenState extends State<AddressDetailsScreen> {
  bool value = false;
  var pickupAdrsController = TextEditingController();
  var deliveryAdrsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    // OrderProvider orderProvider = Provider.of<OrderProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        screenHeight: screenHeight,
        screenWidth: screenWidth,
        title: 'Address Details',
      ),
      bottomNavigationBar:
          Container(color: primaryColor2, child: const CustomBottomBar()),
      body: ListView(physics: const NeverScrollableScrollPhysics(), children: [
        Stack(
          children: [
            Column(
              children: [
                Container(
                  height: screenHeight * 0.29,
                  color: Colors.white,
                  child: Column(
                    children: [
                      SizedBox(
                        height: screenHeight * 0.038,
                      ),
                      ContentCards(
                        childWidget: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             TextField(
                              controller: pickupAdrsController,
                              decoration: InputDecoration(
                                hintText: 'Enter Pickup Address',
                              ),
                              //
                              // style: TextStyle(
                              //   fontFamily: 'PT Sans',
                              //   fontWeight: FontWeight.w800,
                              //   fontSize: screenHeight * 0.02,
                              // ),
                            ),
                            SizedBox(
                              height: screenHeight * 0.016,
                            ),
                           /* AddressInputBox(
                              type: 'Pickup',
                              controller: pickupAdrsController,
                            )*/
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: screenHeight * 0.582,
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
              ],
            ),
            Positioned(
              top: screenHeight * 0.273,
              left: 0.0,
              right: 0.0,
              child: Column(
                children: [
                  ContentCards(
                    childWidget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextField(
                          controller: deliveryAdrsController,
                          decoration: InputDecoration(
                              hintText: 'Enter Delivery Address'),
                          // style: TextStyle(
                          //   fontFamily: 'PT Sans',
                          //   fontWeight: FontWeight.w800,
                          //   fontSize: screenHeight * 0.02,
                          // ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.016,
                        ),
                        /*AddressInputBox(
                          type: 'Delivery',
                          controller: deliveryAdrsController,
                        ),*/
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.016,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Transform.scale(
                        scale: 0.9,
                        child: Checkbox(
                            activeColor: primaryColor1,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            visualDensity:
                                const VisualDensity(horizontal: -3.0),
                            value: value,
                            onChanged: (value) {
                              setState(() {
                                this.value = value!;
                              });
                            }),
                      ),
                      Text(
                        'I agree to the ',
                        style: TextStyle(
                          fontFamily: 'PT Sans',
                          fontWeight: FontWeight.w400,
                          fontSize: screenHeight * 0.0158,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/fourteenth');
                        },
                        child: Text(
                          'Terms & Conditions ',
                          style: TextStyle(
                            fontFamily: 'PT Sans',
                            fontWeight: FontWeight.w700,
                            fontSize: screenHeight * 0.0158,
                            color: primaryColor1,
                          ),
                        ),
                      ),
                      Text(
                        'of Pick My Parcel',
                        style: TextStyle(
                          fontFamily: 'PT Sans',
                          fontWeight: FontWeight.w400,
                          fontSize: screenHeight * 0.0158,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * 0.026,
                  ),
                  PrimaryButton(
                      onPress: () {
                        if (value == true) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SchedulePickupScreen(
                                imageAddress: widget.imageAddress,
                                courierName: widget.courierName,
                                deliveryDuration: widget.deliveryDuration,
                                charges: widget.charges,
                                packageWeight: widget.packageWeight,
                                packageValue: widget.packageValue,
                                shipmentType: widget.shipmentType,
                                deliveryAddress: deliveryAdrsController.text,
                                pickAddress: pickupAdrsController.text,
                                packageContent: widget.packageContent,
                                packageLength: widget.packageLength,
                                packageHeight: widget.packageHeight,
                                packageBreadth: widget.packageBreadth,
                                pickUpPin: widget.pickUpPin,
                                deliveryPin: widget.deliveryPin, vid: widget.vid,
                              ),
                            ),
                          );
                        }
                      },
                      label: 'Schedule Pickup')
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }

  void _updateAddress() {}
}
