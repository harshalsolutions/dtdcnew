import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pick_my_parcel_customer/util/primary_button.dart';

class ADDData extends StatelessWidget {
  ADDData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add data"),
      ),
      body: Center(
          child: PrimaryButton(
        label: "Add data",
        onPress: () {
          addData();
        },
      )),
    );
  }

  var data = {
    "Weight": 20,
    "liteDeliveryTime": "2-3 days",
    "litePrice": 170,
    "pickupPrice": 30,
    "premiumDeliveryTime": "1 day",
    "premiumPrice": 480
  };
  Future<void> addData() async {
    await FirebaseFirestore.instance
        .collection("Prices")
        .doc("hyderabad")
        .collection("charges")
        .add(data);
  }
}
