import 'dart:collection';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pick_my_parcel_customer/providers/vendor_provider.dart';
import 'package:pick_my_parcel_customer/widgets/courier_available.dart';
import 'package:pick_my_parcel_customer/widgets/dropdown_selector.dart';
import 'package:pick_my_parcel_customer/widgets/order_details_summary.dart';
import 'package:provider/provider.dart';

import '../constants/constants.dart';
import '../util/content_cards.dart';
import '../widgets/app_bar.dart';
import '../widgets/bottom_navigation_bar.dart';

class CourierRatesScreen extends StatefulWidget {
  final String pickUpPin;
  final String deliveryPin;
  final String packageContent;
  final double packageWeight;
  final double packageLength;
  final double packageBreadth;
  final double packageHeight;
  final double packageValue;
  final String shipmentType;
  final String pickupcity;
  final String deliverycity;

  const CourierRatesScreen(
      {Key? key,
      required this.packageWeight,
      required this.packageValue,
      required this.shipmentType,
      required this.pickUpPin,
      required this.deliveryPin,
      required this.packageContent,
      required this.packageLength,
      required this.packageBreadth,
      required this.packageHeight,
      required this.pickupcity,
      required this.deliverycity})
      : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  _CourierRatesScreenState createState() =>
      // ignore: no_logic_in_create_state
      _CourierRatesScreenState(pickupcity, deliverycity, packageWeight);
}

class _CourierRatesScreenState extends State<CourierRatesScreen> {
  _CourierRatesScreenState(
      this.pickupcity, this.deliverycity, this.packageWeight);
  final double packageWeight;
  final String pickupcity;
  final String deliverycity;
  late VendorProvider vendorProvider;

  Future<Map<String, dynamic>> fetchPickupCharges() async {
    Map<String, dynamic> pickupPrices = {};
    await FirebaseFirestore.instance
        .collection("Prices")
        .doc(widget.pickupcity.toLowerCase())
        .collection("charges")
        .where("Weight", isGreaterThanOrEqualTo: packageWeight)
        .orderBy("Weight")
        .limit(1)
        .get()
        .then((value) {
      pickupPrices = value.docs.first.data();
    });

    return pickupPrices;
  }

  Future<Map<String, dynamic>> fetchDeliveryCharges() async {
    Map<String, dynamic> pickupPrices = {};

    await FirebaseFirestore.instance
        .collection("Prices")
        .doc(widget.deliverycity.toLowerCase())
        .collection("charges")
        .where("Weight", isGreaterThanOrEqualTo: packageWeight)
        .orderBy("Weight")
        .limit(1)
        .get()
        .then((value) {
      pickupPrices = value.docs.first.data();
    });

    return pickupPrices;
  }

  @override
  void initState() {
    vendorProvider = Provider.of(context, listen: false);
    vendorProvider.fetchVendorsList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double volumetricwt =
        (widget.packageLength * widget.packageBreadth * widget.packageHeight) /
            50000;
    double weightfinal = max(widget.packageWeight, volumetricwt);
    vendorProvider = Provider.of(context);

    return Scaffold(
      appBar: CustomAppBar(
        screenHeight: screenHeight,
        screenWidth: screenWidth,
        title: 'Courier Rates',
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar:
          Container(color: primaryColor2, child: const CustomBottomBar()),
      body: SafeArea(
        child: ListView(physics: const ClampingScrollPhysics(), children: [
          Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: screenHeight * 0.138,
                  ),
                  Container(
                    height: screenHeight * 0.9,
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
                top: screenHeight * 0.02,
                left: 0.0,
                right: 0.0,
                child: Column(
                  children: [
                    OrderDetailsSummaryBox(
                      applicableWeight: weightfinal.toString(),
                      packageValue: widget.packageValue,
                      pickUpPin: widget.pickUpPin,
                      packageContent: widget.packageContent,
                      packageBreadth: widget.packageBreadth,
                      packageLength: widget.packageLength,
                      packageWeight: widget.packageWeight,
                      packageHeight: widget.packageHeight,
                      deliveryPin: widget.deliveryPin,
                      shipmentType: widget.shipmentType,
                      pickupcity: pickupcity,
                      deliverycity: deliverycity,
                    ),
                    SizedBox(
                      height: screenHeight * 0.0236,
                    ),
                    ContentCards(
                      childWidget: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: <Widget>[
                            Column(children: <Widget>[
                              const Text("Normal Delivery"),
                              Padding(
                                  padding: EdgeInsets.only(
                                      bottom: screenHeight * 0.05)),
                              FutureBuilder<Map<String, dynamic>>(
                                  future: fetchPickupCharges(),
                                  builder: (BuildContext context,
                                      AsyncSnapshot<Map<String, dynamic>>
                                          snapshot) {
                                    if (snapshot.hasData) {
                                      var price = snapshot.data!["litePrice"]
                                          .toString();
                                      var time =
                                          snapshot.data!["liteDeliveryTime"];
                                      if (snapshot.data!["Weight"] > 1) {
                                        price = (widget.packageWeight *
                                                snapshot.data!["litePrice"])
                                            .toString();
                                      }
                                      return Column(
                                        children: <Widget>[
                                          Text(
                                            "Price:  Rs " + price,
                                            style: TextStyle(
                                              fontFamily: 'PT Sans',
                                              fontWeight: FontWeight.w400,
                                              fontSize: screenHeight * 0.018,
                                            ),
                                          ),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  bottom: screenHeight * 0.05)),
                                          Text(
                                            "Delivery Time: " + time,
                                            style: TextStyle(
                                              fontFamily: 'PT Sans',
                                              fontWeight: FontWeight.w400,
                                              fontSize: screenHeight * 0.018,
                                            ),
                                          ),
                                        ],
                                      );
                                    }
                                    return const Text("Error fetching prices");
                                  }),
                            ]),
                            Padding(
                                padding:
                                    EdgeInsets.only(right: screenWidth * 0.13)),
                            Column(children: <Widget>[
                              const Text("Premium Delivery"),
                              Padding(
                                  padding: EdgeInsets.only(
                                      bottom: screenHeight * 0.05)),
                              FutureBuilder<Map<String, dynamic>>(
                                  future: fetchDeliveryCharges(),
                                  builder: (BuildContext context,
                                      AsyncSnapshot<Map<String, dynamic>>
                                          snapshot) {
                                    if (snapshot.hasData) {
                                      var price = snapshot.data!["premiumPrice"]
                                          .toString();
                                      var time =
                                          snapshot.data!["premiumDeliveryTime"];
                                      if (snapshot.data!["Weight"] > 1) {
                                        price = (widget.packageWeight *
                                                snapshot.data!["premiumPrice"])
                                            .toString();
                                      }
                                      return Column(
                                        children: <Widget>[
                                          Text(
                                            "Price: Rs " + price,
                                            style: TextStyle(
                                              fontFamily: 'PT Sans',
                                              fontWeight: FontWeight.w400,
                                              fontSize: screenHeight * 0.018,
                                            ),
                                          ),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  bottom: screenHeight * 0.05)),
                                          Text(
                                            "Delivery Time: " + time,
                                            style: TextStyle(
                                              fontFamily: 'PT Sans',
                                              fontWeight: FontWeight.w400,
                                              fontSize: screenHeight * 0.018,
                                            ),
                                          ),
                                        ],
                                      );
                                    }
                                    return const Text("Error fetching prices");
                                  }),
                            ])
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.0236,
                    ),
                    ContentCards(
                        childWidget: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${vendorProvider.vendorList.length} Courier Found',
                              style: TextStyle(
                                fontFamily: 'PT Sans',
                                fontWeight: FontWeight.w400,
                                fontSize: screenHeight * 0.018,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  'Sort By:',
                                  style: TextStyle(
                                      fontFamily: 'PT Sans',
                                      fontWeight: FontWeight.w400,
                                      fontSize: screenHeight * 0.018,
                                      color: const Color(0xffB3B3B3)),
                                ),
                                SizedBox(
                                  width: screenWidth * 0.011,
                                ),
                                const DropDownSelector(
                                  listItems: [
                                    'Low Price',
                                    'Faster Delivery',
                                    'Popularity'
                                  ],
                                  selectedItem: 'Low Price',
                                  width: 120,
                                  height: 25,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: screenHeight * 0.0128,
                        ),
                        Container(
                          height: screenHeight * 0.49,
                          margin: const EdgeInsets.only(top: 11),
                          child: ListView.builder(
                              itemCount: vendorProvider.vendorList.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  height: screenHeight * 0.25,
                                  margin: const EdgeInsets.only(top: 7),
                                  child: CourierAvailable(
                                    courierName: vendorProvider
                                        .getVendorList[index].companyName,
                                    imageAddress: 'images/DHL Icon.png',
                                    deliveryDuration: '6 Days',
                                    charges: '₹200',
                                    packageValue:
                                        widget.packageValue.toString(),
                                    shipmentType:
                                        widget.shipmentType.toString(),
                                    packageWeight:
                                        widget.packageWeight.toString(),
                                    packageContent: widget.packageContent,
                                    packageBreadth: widget.packageBreadth,
                                    packageLength: widget.packageLength,
                                    packageHeight: widget.packageHeight,
                                    pickUpPin: widget.pickUpPin,
                                    deliveryPin: widget.deliveryPin,
                                    vid:
                                        vendorProvider.getVendorList[index].vid,
                                  ),
                                );
                              }),
                        ),
                        /*  CourierAvailable(
                          courierName: 'FedEx',
                          imageAddress: 'images/FedEx Icon.png',
                          deliveryDuration: '6 Days',
                          charges: '₹200',
                          packageValue: widget.packageValue.toString(),
                          shipmentType: widget.shipmentType.toString(),
                          packageWeight: widget.packageWeight.toString(),
                        ),
                        CourierAvailable(
                          courierName: 'Amazon',
                          imageAddress: 'images/Amazon Icon.png',
                          deliveryDuration: '6 Days',
                          charges: '₹200',
                          packageValue: widget.packageValue.toString(),
                          shipmentType: widget.shipmentType.toString(),
                          packageWeight: widget.packageWeight.toString(),
                        )*/
                      ],
                    ))
                  ],
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
