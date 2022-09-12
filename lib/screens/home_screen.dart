import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pick_my_parcel_customer/constants/constants.dart';
import 'package:pick_my_parcel_customer/providers/order_provider.dart';
import 'package:pick_my_parcel_customer/widgets/bottom_navigation_bar.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../homePageSlides/slide1.dart';
import '../homePageSlides/slide2.dart';
import '../homePageSlides/slide3.dart';
import '../widgets/primary_order_track_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = PageController();
  TextEditingController trackController = TextEditingController();
  Map? userData;

  _getUserData() async {
    try {
      await FirebaseFirestore.instance
          .collection("Users")
          .where("phone",
              isEqualTo: FirebaseAuth.instance.currentUser?.phoneNumber)
          .get()
          .then((value) {
        for (var doc in value.docs) {
          setState(() {
            userData = doc.data();
          });
        }
      });
    } catch (e) {
      log(e.toString());
    }
  }

  late OrderProvider orderProvider;

  @override
  void initState() {
    super.initState();
    _getUserData();
    orderProvider = Provider.of(context, listen: false);
    orderProvider.fetchWaitingOrderList();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    orderProvider = Provider.of(context);

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: primaryColor2,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: primaryColor1,
          ),
          toolbarHeight: 0.0,
          elevation: 0.0,
          backgroundColor: primaryColor1,
        ),
        body: Stack(children: [
          ListView(
            physics: const ClampingScrollPhysics(),
            children: [
              Container(
                height: screenHeight * 0.475,
                decoration: BoxDecoration(
                  color: primaryColor1,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(screenHeight * 0.0338),
                    bottomRight: Radius.circular(screenHeight * 0.0338),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: screenHeight * 0.033,
                          left: screenWidth * 0.079,
                          right: screenWidth * 0.079),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello, ${userData?['name'] ?? ""}!',
                            style: TextStyle(
                              fontFamily: 'Montserrat SemiBold',
                              fontWeight: FontWeight.w800,
                              fontSize: screenHeight * 0.0225,
                            ),
                          ),
                          SizedBox(
                            height: screenHeight * 0.0079,
                          ),
                          Text(
                            '${userData?['address'] ?? ""}',
                            style: TextStyle(
                              fontFamily: 'PT Sans',
                              fontWeight: FontWeight.w400,
                              fontSize: screenHeight * 0.018,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: screenHeight * 0.0225,
                          ),
                          TextField(
                            keyboardType: TextInputType.number,
                            // onChanged: (value){
                            //   Navigator.push(context, MaterialPageRoute(builder: (context)=>TrackYourCourierScreen()));
                            // },
                            controller: trackController,
                            style: TextStyle(
                              fontFamily: 'PT Sans',
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              fontSize: screenHeight * 0.0158,
                            ),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.04,
                                  vertical: screenHeight * 0.015),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0XFFE0E0E0)),
                                  borderRadius: BorderRadius.circular(8)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0XFFE0E0E0)),
                                  borderRadius: BorderRadius.circular(8)),
                              prefixIcon: Image.asset(
                                'images/tracking-icon.png',
                                width: 10,
                                height: 10,
                              ),
                              suffixIcon: InkWell(
                                  onTap: () {
                                    if (trackController.text != null) {
                                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                      //     TrackYourCourierScreen(orderModelList: orderProvider.getSearchOrder,)));
                                      Navigator.pushNamed(context, '/eleventh',
                                          arguments: {
                                            "orderList": {
                                              'trackingId': "trackingId",
                                              'vid': "vid",
                                              'uid': " uid",
                                              'packageContent':
                                                  "packageContent",
                                              'pickupAdrs': "pickupAdrs",
                                              'deliveryAdrs': "deliveryAdrs",
                                              'pickupPin': "pickupPin",
                                              'deliveryPin': "deliveryPin",
                                              'weight': "weight",
                                              'length': "length",
                                              'breadth': "breadth",
                                              'height': "height",
                                              'packageValue': "packageValue",
                                              'orderStatus': "orderStatus",
                                              'pickupTime': "pickupTime",
                                              'shipmentType': "shipmentType",
                                            }
                                          });
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                              SnackBar(content: Text("Empty")));
                                    }
                                  },
                                  child: const Icon(
                                    Icons.keyboard_arrow_right_outlined,
                                    color: Colors.white,
                                  )),
                              hintText: 'Enter 10-digit tracking number',
                              hintStyle: TextStyle(
                                fontFamily: 'PT Sans',
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                                fontSize: screenHeight * 0.0158,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: screenHeight * 0.036,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.195,
                      child: PageView(
                        controller: _controller,
                        children: const [
                          Slide1(),
                          Slide2(),
                          Slide3(),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.027,
                    ),
                    Center(
                      child: SmoothPageIndicator(
                        controller: _controller,
                        count: 3,
                        effect: ExpandingDotsEffect(
                            activeDotColor: Colors.white,
                            dotColor: const Color(0xffCCCCCC),
                            dotHeight: screenHeight * 0.0112,
                            dotWidth: screenWidth * 0.0233,
                            expansionFactor: 2.5),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight * 0.0474,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.079),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          Navigator.pushNamed(context, '/sixth');
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.042),
                        height: screenHeight * 0.056,
                        decoration: BoxDecoration(
                            color: primaryColor1,
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Place an Order',
                              style: TextStyle(
                                fontFamily: 'PT Sans',
                                fontWeight: FontWeight.w700,
                                fontSize: screenHeight * 0.02,
                                color: Colors.white,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.white,
                              size: screenHeight * 0.02,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.0225,
                    ),
                    GestureDetector(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.042),
                        height: screenHeight * 0.056,
                        decoration: BoxDecoration(
                            color: primaryColor1,
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Call for Booking/Enquiry',
                              style: TextStyle(
                                fontFamily: 'PT Sans',
                                fontWeight: FontWeight.w700,
                                fontSize: screenHeight * 0.02,
                                color: Colors.white,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.white,
                              size: screenHeight * 0.02,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight * 0.027,
              ),
              Stack(children: [
                Container(
                  height: screenHeight * 0.4,
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
                      'Waiting Orders (${orderProvider.waitingOrderList.length})',
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
                    height: screenHeight * 0.4,
                    decoration: BoxDecoration(
                        color: primaryColor2,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(screenHeight * 0.0338),
                          topRight: Radius.circular(screenHeight * 0.0338),
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
                  child: SizedBox(
                    height: screenHeight * 0.222,
                    child: ListView.builder(
                        itemCount: orderProvider.waitingOrderList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.only(top: 7),
                            child: PrimaryOrderTrackCard(
                                trackingID: orderProvider
                                    .waitingOrderList[index].trackingId,
                                pickupCity: orderProvider
                                    .waitingOrderList[index].pickupAdrs,
                                deliveryCity: orderProvider
                                    .waitingOrderList[index].deliveryAdrs,
                                pickupPin: orderProvider
                                    .waitingOrderList[index].pickupPin,
                                deliveryPin: orderProvider
                                    .waitingOrderList[index].deliveryPin),
                          );
                        }),
                  ),
                ),
              ])
            ],
          ),
          const Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: CustomBottomBar(),
          )
        ]),
      ),
    );
  }
}
