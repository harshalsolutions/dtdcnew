import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../models/user.dart';

class UserProvider with ChangeNotifier {
  late UserModel userModel;
  List<UserModel> userList = [];

  void addUserData(
      String name, String address, String mobile, String email) async {
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({
      'name': name,
      'address': address,
      'mobile': mobile,
      'email': email,
      'imgUrl': "",
      'uid': FirebaseAuth.instance.currentUser!.uid
    });
  }

  fetchUserData() async {
    FirebaseFirestore.instance
        .collection("Users")
        .where("phone",
            isEqualTo: FirebaseAuth.instance.currentUser!.phoneNumber)
        .get()
        .then((value) {
      userList.clear();
      for (var doc in value.docs) {
        userModel = UserModel.fromMap(doc.data());
        /* log(doc.data().toString());
        log(vendorModel.vid);*/
        userList.add(userModel);
      }
      notifyListeners();
    });
  }

  List<UserModel> get getVendorList {
    return userList;
  }
}
