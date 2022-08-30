import 'package:flutter/material.dart';
import 'package:pick_my_parcel_customer/providers/order_provider.dart';
import 'package:pick_my_parcel_customer/widgets/bottom_navigation_bar.dart';
import 'package:provider/provider.dart';

import '../constants/constants.dart';
import '../widgets/app_bar.dart';
import '../widgets/current_order_card.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({Key? key}) : super(key: key);

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  late OrderProvider orderProvider;

  @override
  void initState() {
    orderProvider = Provider.of<OrderProvider>(context, listen: false);
    orderProvider.fetchAcceptedOrderList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    orderProvider = Provider.of(context);

    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 0.97),
      appBar: CustomAppBar(
        screenHeight: screenHeight,
        screenWidth: screenWidth,
        title: 'My Orders',
      ),
      bottomNavigationBar:
          Container(color: primaryColor2, child: const CustomBottomBar()),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: screenHeight * 0.0225, left: screenWidth * 0.079),
              child: Text(
                'Current Orders (${orderProvider.acceptedOrderList.length})',
                style: TextStyle(
                    fontFamily: 'Archivo',
                    fontWeight: FontWeight.w700,
                    fontSize: screenHeight * 0.0225,
                    letterSpacing: 0.5),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.70,
              child: ListView.builder(
                  itemCount: orderProvider.acceptedOrderList.length,
                  itemBuilder: ((context, index) {
                    return Container(
                      margin: const EdgeInsets.only(top: 11),
                      child: CurrentOrderCard(
                          trackingID: orderProvider.acceptedOrderList[index].trackingId,
                          pickupCity: orderProvider.acceptedOrderList[index].pickupAdrs,
                          deliveryCity:
                              orderProvider.acceptedOrderList[index].deliveryAdrs,
                          pickupPin: orderProvider.acceptedOrderList[index].pickupPin,
                          deliveryPin: orderProvider.acceptedOrderList[index].deliveryPin,
                          orderValue: '₹5234',
                          applicableWeight:
                              '${orderProvider.acceptedOrderList[index].weight} Kg'),
                    );
                  })),
            )
          ],
        ),
      ),
    );
  }
}
