import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:pick_my_parcel_customer/models/order.dart';

class OrderProvider extends ChangeNotifier {
  List<OrderModel> acceptedOrderList = [];
  List<OrderModel> completedOrderList = [];
  List<OrderModel> waitingOrderList = [];
  late OrderModel orderModel;

  List<OrderModel> searchOrderModel = [];

  fetchAcceptedOrderList() async {
    FirebaseFirestore.instance
        .collection("Orders")
        .where('uid', isEqualTo: "${FirebaseAuth.instance.currentUser?.uid}")
        .where("orderStatus", whereIn: ["accepted", 'dispatched', 'picked'])
        .get()
        .then((value) {
          acceptedOrderList.clear();
          for (var doc in value.docs) {
            orderModel = OrderModel.fromMap(doc.data());
            acceptedOrderList.add(orderModel);
          }
          acceptedOrderList = acceptedOrderList.reversed.toList();
          notifyListeners();
        });
  }

  List<OrderModel> get getAcceptedOrderList {
    return acceptedOrderList;
  }

  fetchWaitingOrderList() async {
    FirebaseFirestore.instance
        .collection("Orders")
        .where('uid', isEqualTo: "${FirebaseAuth.instance.currentUser?.uid}")
        .where("orderStatus", isEqualTo: "waiting")
        .get()
        .then((value) {
      waitingOrderList.clear();
      for (var doc in value.docs) {
        orderModel = OrderModel.fromMap(doc.data());
        waitingOrderList.add(orderModel);
      }
      waitingOrderList = waitingOrderList.reversed.toList();
      notifyListeners();
    });
  }

  List<OrderModel> get getWaitingOrderList {
    return waitingOrderList;
  }

  void addOrderData(
      {required String packageContent,
      required String pickupAdrs,
      required String deliveryAdrs,
      required String pickupPin,
      required String deliveryPin,
      required double weight,
      required double length,
      required double breadth,
      required double height,
      required double packageValue,
      required String orderStatus,
      required String vid,
      required String trackingId,
      required String shipmentType,
      required String paymentMethod,
      required String pickupTime}) async {
    await FirebaseFirestore.instance.collection("Orders").doc(trackingId).set({
      'trackingId': trackingId,
      'vid': vid,
      'uid': FirebaseAuth.instance.currentUser!.uid,
      'packageContent': packageContent,
      'pickupAdrs': pickupAdrs,
      'deliveryAdrs': deliveryAdrs,
      'pickupPin': pickupPin,
      'deliveryPin': deliveryPin,
      'weight': weight,
      'length': length,
      'breadth': breadth,
      'height': height,
      'packageValue': packageValue,
      'orderStatus': orderStatus,
      'shipmentType': shipmentType,
      'paymentMethod': paymentMethod,
      'pickupTime': pickupTime
    });
    notifyListeners();
  }

  trackOrder(String trackId) async {
    FirebaseFirestore.instance
        .collection("Orders")
        .where("trackingId", isEqualTo: trackId)
        .get()
        .then((value) {
      acceptedOrderList.clear();
      for (var doc in value.docs) {
        orderModel = OrderModel.fromMap(doc.data());
        log(orderModel.deliveryAdrs);
        acceptedOrderList.add(orderModel);
      }
    });
    notifyListeners();
  }

  fetchCompletedOrderList() async {
    FirebaseFirestore.instance
        .collection("Orders")
        .where('uid', isEqualTo: "${FirebaseAuth.instance.currentUser?.uid}")
        .where('orderStatus', isEqualTo: 'complete')
        .get()
        .then((value) {
      completedOrderList.clear();
      for (var doc in value.docs) {
        orderModel = OrderModel.fromMap(doc.data());
        log(orderModel.deliveryAdrs);
        completedOrderList.add(orderModel);
      }
      completedOrderList = completedOrderList.reversed.toList();
      notifyListeners();
    });
  }

  List<OrderModel> get getCompletedOrderList {
    return completedOrderList;
  }

  orderModels(QueryDocumentSnapshot element) {
    orderModel = OrderModel(
        trackingId: element.get("trackingId"),
        uid: element.get("uid"),
        vid: element.get("vid"),
        packageContent: element.get("packageContent"),
        pickupAdrs: element.get("pickupAdrs"),
        deliveryAdrs: element.get("deliveryAdrs"),
        weight: element.get("weight"),
        length: element.get("length"),
        breadth: element.get("breadth"),
        height: element.get("height"),
        packageValue: element.get("packageValue"),
        orderStatus: element.get("orderStatus"),
        deliveryPin: element.get("deliveryPin"),
        pickupPin: element.get("pickupPin"),
        shipmentType: element.get("shipmentType"),
        pickupTime: element.get("pickupTime"),
        paymentMethod: element.get("paymentMethod"));
    searchOrderModel.add(orderModel);
  }

  searchOrder(String trackId) {}

  List<OrderModel> get getSearchOrder {
    return searchOrderModel;
  }
}
