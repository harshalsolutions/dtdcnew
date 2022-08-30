import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pick_my_parcel_customer/providers/user_provider.dart';
import 'package:provider/provider.dart';

import '../constants/constants.dart';
import '../widgets/app_bar.dart';
import '../widgets/bottom_navigation_bar.dart';
import '../widgets/camera_bottom_sheet.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Map? userData;

  late UserProvider userProvider;

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userProvider = Provider.of(context, listen: false);
    userProvider.fetchUserData();
    _getUserData();
  }

  @override
  Widget build(BuildContext context) {
    var userName = userData!['name'] ?? '';
    var phoneNumber = userData!['phone'];
    var email = userData!['email'];
    var urlImage = userData!['imgUrl'] ??
        'https://images.unsplash.com/photo-1580489944761-15a19d654956?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fHBvcnRyYWl0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60';
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        screenHeight: screenHeight,
        screenWidth: screenWidth,
        title: 'Profile',
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: screenHeight * 0.055,
                ),
                ProfileImageWidget(
                  screenWidth: screenWidth,
                  screenHeight: screenHeight,
                  imgUrl: urlImage,
                ),
                SizedBox(
                  height: screenHeight * 0.089,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.0338,
                      horizontal: screenWidth * 0.079),
                  height: screenHeight * 0.5694,
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
                  child: Column(
                    children: [
                      TextFormField(
                        initialValue: userName,
                        style: TextStyle(
                          fontFamily: 'Archivo',
                          fontSize: screenHeight * 0.018,
                          fontWeight: FontWeight.w700,
                        ),
                        decoration: InputDecoration(
                          labelText: 'Name',
                          labelStyle: TextStyle(
                              fontFamily: 'Antonio',
                              fontSize: screenHeight * 0.018,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xffB5B5B5)),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffB5B5B5)),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.043,
                      ),
                      TextFormField(
                        initialValue: phoneNumber,
                        style: TextStyle(
                          fontFamily: 'Archivo',
                          fontSize: screenHeight * 0.018,
                          fontWeight: FontWeight.w700,
                        ),
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          labelStyle: TextStyle(
                              fontFamily: 'Antonio',
                              fontSize: screenHeight * 0.018,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xffB5B5B5)),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffB5B5B5)),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.043,
                      ),
                      TextFormField(
                        initialValue: email,
                        style: TextStyle(
                          fontFamily: 'Archivo',
                          fontSize: screenHeight * 0.018,
                          fontWeight: FontWeight.w700,
                        ),
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(
                              fontFamily: 'Antonio',
                              fontSize: screenHeight * 0.018,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xffB5B5B5)),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffB5B5B5)),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.043,
                      ),
                     /* SizedBox(
                        width: screenWidth*0.9,
                        height: screenHeight * 0.043,
                        child: ElevatedButton(
                          onPressed: (){

                          },
                          child: Text("UPDATE"),
                        ),
                      ),*/
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: CustomBottomBar(),
          )
        ],
      ),
    );
  }
}
