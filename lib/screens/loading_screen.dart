import 'package:flutter/material.dart';
import 'package:pick_my_parcel_customer/screens/address_details_screen.dart';

class OrderLoadingScreen extends StatefulWidget {
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

  const OrderLoadingScreen({
    Key? key,
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
    required this.packageHeight,
    required this.vid,
  }) : super(key: key);

  @override
  State<OrderLoadingScreen> createState() => _OrderLoadingScreenState();
}

class _OrderLoadingScreenState extends State<OrderLoadingScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextPage();
  }

  void _navigateToNextPage() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => AddressDetailsScreen(
                imageAddress: widget.imageAddress,
                courierName: widget.courierName,
                deliveryDuration: widget.deliveryDuration,
                charges: widget.charges,
                packageWeight: widget.packageWeight,
                packageValue: widget.packageValue,
                shipmentType: widget.shipmentType,
                packageContent: widget.packageContent,
                packageBreadth: widget.packageBreadth,
                packageHeight: widget.packageHeight,
                packageLength: widget.packageLength,
                deliveryPin: widget.deliveryPin,
                pickUpPin: widget.pickUpPin,
                vid: widget.vid,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage('images/loading.png'),
            ),
            const SizedBox(
              height: 50.0,
            ),
            SizedBox(
              width: 300.0,
              child: Wrap(
                children: const [
                  Text(
                    'Your order is under process. This might take a few minutes.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'PT Sans',
                        fontSize: 20.0,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
