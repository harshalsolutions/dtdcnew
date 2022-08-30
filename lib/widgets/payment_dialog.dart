import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pick_my_parcel_customer/constants/constants.dart';
import 'package:pick_my_parcel_customer/models/order.dart';
import 'package:pick_my_parcel_customer/screens/order_confirmed_screen.dart';
import 'package:provider/provider.dart';
import '../providers/order_provider.dart';
import '../util/primary_button.dart';

String selectedPayment = '';
void showPaymentDialog({
  required BuildContext context,
  required final String imageAddress,
  required final String courierName,
  required final String deliveryDuration,
  required final String charges,
  required final String shipmentType,
  required final String pickupTime,
  required final String pickupAdrs,
  required final String scheduleAdrs,
  required final String pickUpPin,
  required final String deliveryPin,
  required final String vid,
  required final String packageContent,
  required final double packageWeight,
  required final double packageLength,
  required final double packageBreadth,
  required final double packageHeight,
  required final double packageValue,
}) {
  OrderProvider orderProvider =
      Provider.of<OrderProvider>(context, listen: false);
  log(pickupTime);
  showDialog(
    context: context,
    builder: (BuildContext context) => StatefulBuilder(
      builder: (context, setState) => Dialog(
        child: SizedBox(
          width: 360.0,
          height: 470.0,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.close_rounded)),
                const SizedBox(
                  height: 40.0,
                ),
                Container(
                  width: 300.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 30.0,
                          spreadRadius: 0.0,
                          color: Color.fromRGBO(0, 0, 0, 0.05),
                          offset: Offset(-10.0, 10.0),
                        ),
                        BoxShadow(
                          blurRadius: 30.0,
                          spreadRadius: 0.0,
                          color: Color.fromRGBO(0, 0, 0, 0.04),
                          offset: Offset(10.0, -10.0),
                        )
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Radio(
                            activeColor: primaryColor1,
                            splashRadius: 0.0,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            value: 'COD',
                            groupValue: selectedPayment,
                            onChanged: (value) {
                              setState(() {
                                selectedPayment = value.toString();
                              });
                            },
                          ),
                          const Text(
                            'COD',
                            style: TextStyle(
                                fontFamily: 'PT Sans',
                                fontWeight: FontWeight.w700,
                                fontSize: 20.0),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40.0, right: 30.0),
                        child: Wrap(children: const [
                          Text(
                            'Pay in cash when you parcel is picked.',
                            style: TextStyle(
                                fontFamily: 'PT Sans',
                                fontWeight: FontWeight.w400,
                                fontSize: 16.0),
                          ),
                        ]),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Container(
                  width: 300.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 30.0,
                          spreadRadius: 0.0,
                          color: Color.fromRGBO(0, 0, 0, 0.05),
                          offset: Offset(-10.0, 10.0),
                        ),
                        BoxShadow(
                          blurRadius: 30.0,
                          spreadRadius: 0.0,
                          color: Color.fromRGBO(0, 0, 0, 0.04),
                          offset: Offset(10.0, -10.0),
                        )
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Radio(
                            splashRadius: 0.0,
                            activeColor: primaryColor1,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            value: 'Online Payment',
                            groupValue: selectedPayment,
                            onChanged: (value) {
                              setState(() {
                                selectedPayment = value.toString();
                              });
                            },
                          ),
                          const Text(
                            'Online Payment',
                            style: TextStyle(
                                fontFamily: 'PT Sans',
                                fontWeight: FontWeight.w700,
                                fontSize: 20.0),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40.0, right: 30.0),
                        child: Wrap(children: const [
                          Text(
                            'Pay via the payment gateway.',
                            style: TextStyle(
                                fontFamily: 'PT Sans',
                                fontWeight: FontWeight.w400,
                                fontSize: 16.0),
                          ),
                        ]),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 60.0,
                ),
                PrimaryButton(
                    onPress: () {
                      var randomTrackingId =
                          DateTime.now().microsecondsSinceEpoch.toString();

                      if (selectedPayment != '') {
                        orderProvider.addOrderData(
                            packageContent: packageContent,
                            pickupAdrs: pickupAdrs,
                            deliveryAdrs:scheduleAdrs,
                            pickupPin: pickUpPin,
                            deliveryPin: deliveryPin,
                            weight: packageWeight,
                            length: packageLength,
                            breadth: packageBreadth,
                            height: packageHeight,
                            packageValue: packageValue,
                            orderStatus: "waiting",
                            pickupTime: pickupTime,
                            vid: vid,
                            paymentMethod:selectedPayment,
                            trackingId: randomTrackingId, shipmentType: shipmentType);

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OrderConfirmedScreen(
                              deliveryDuration: deliveryDuration,
                              imageAddress: imageAddress,
                              packageValue: packageValue.toString(),
                              shipmentType: shipmentType,
                              charges: charges,
                              courierName: courierName,
                              packageWeight: packageWeight.toString(),
                            ),
                          ),
                        );
                      }
                    },
                    label: 'Proceed')
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
