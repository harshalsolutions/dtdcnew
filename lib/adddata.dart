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
          print("clicked");
          addData();
        },
      )),
    );
  }

  var data = [
    {
      "Pin Code": 110001,
      "District": "DELHI",
      "State": "DELHI",
      "charges/0/weight": 0.25,
      "charges/0/litePrice": 110,
      "charges/0/liteDelivery": "2-3 days",
      "charges/0/pickupPrice": 380,
      "charges/1/weight": 0.5,
      "charges/1/litePrice": 110,
      "charges/1/liteDelivery": "2-3 days",
      "charges/1/pickupPrice": 380,
      "charges/2/weight": 1,
      "charges/2/litePrice": 110,
      "charges/2/liteDelivery": "2-3 days",
      "charges/2/pickupPrice": 380,
      "charges/3/weight": 10,
      "charges/3/litePrice": 110,
      "charges/3/liteDelivery": "2-3 days",
      "charges/3/pickupPrice": 380,
      "charges/4/weight": 20,
      "charges/4/litePrice": 110,
      "charges/4/liteDelivery": "2-3 days",
      "charges/4/pickupPrice": 380
    },
    {
      "Pin Code": 110002,
      "District": "DELHI",
      "State": "DELHI",
      "charges/0/weight": 0.25,
      "charges/0/litePrice": 110,
      "charges/0/liteDelivery": "2-3 days",
      "charges/0/pickupPrice": 380,
      "charges/1/weight": 0.5,
      "charges/1/litePrice": 110,
      "charges/1/liteDelivery": "2-3 days",
      "charges/1/pickupPrice": 380,
      "charges/2/weight": 1,
      "charges/2/litePrice": 110,
      "charges/2/liteDelivery": "2-3 days",
      "charges/2/pickupPrice": 380,
      "charges/3/weight": 10,
      "charges/3/litePrice": 110,
      "charges/3/liteDelivery": "2-3 days",
      "charges/3/pickupPrice": 380,
      "charges/4/weight": 20,
      "charges/4/litePrice": 110,
      "charges/4/liteDelivery": "2-3 days",
      "charges/4/pickupPrice": 380
    }
  ];
  Future<void> addData() async {
    for (var element in data) {
      for (var i = 0; i < 5; i++) {
        await FirebaseFirestore.instance
            .collection("testprices")
            .doc(element["Pin Code"].toString())
            .collection("charges")
            .add({
          "Weight": element["charges/$i/weight"],
          "litePrice": element["charges/$i/litePrice"],
          "liteDeliverytime": element["charges/$i/liteDelivery"]
        }).then((value) => print("complete"));
      }
    }
  }
}
