import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:pick_my_parcel_customer/models/vendor.dart';

class VendorProvider extends ChangeNotifier {
  late VendorModel vendorModel;
  List<VendorModel> vendorList = [];

  fetchVendorsList() async {
    FirebaseFirestore.instance.collection("Vendors").get().then((value) {
      vendorList.clear();
      for (var doc in value.docs) {
        vendorModel = VendorModel.fromMap(doc.data());
        /* log(doc.data().toString());
        log(vendorModel.vid);*/
        vendorList.add(vendorModel);
      }
      notifyListeners();
    });
  }

  List<VendorModel> get getVendorList {
    return vendorList;
  }
}
