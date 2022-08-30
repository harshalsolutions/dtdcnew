import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pick_my_parcel_customer/constants/constants.dart';

import '../util/primary_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController mobileController = TextEditingController();

  final _auth = FirebaseAuth.instance;

  Future<void> sendOtp(BuildContext context, String number) async {
    String phone = "+91" + number.trim();

    await _auth.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (PhoneAuthCredential credential) async {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) async {
        Navigator.pushNamed(context, '/third',
            arguments: {'verificationId': verificationId, 'phone': phone});
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  Map? userData;

  _getUserData(String number) async {
    try {
      print(number);
      await FirebaseFirestore.instance
          .collection("Users")
          .where("phone", isEqualTo: "+91${number.trim()}")
          .get()
          .then((value) {
        if (value.docs.isNotEmpty) {
          setState(() {
            userData = value.docs.first.data();
          });
        } else {
          setState(() {
            userData == null;
          });
        }
      });
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
                top: screenHeight * 0.034,
                left: screenWidth * 0.079,
                right: screenWidth * 0.079),
            child: SingleChildScrollView(
              child: Stack(children: [
                Column(
                  children: [
                    SizedBox(
                      height: screenHeight * 0.022,
                    ),
                    SizedBox(
                      height: screenHeight * 0.32,
                      width: screenWidth * 0.80,
                      child: Image.asset('images/login.png'),
                    ),
                    SizedBox(
                      height: screenHeight * 0.045,
                    ),
                    Text(
                      'Sign In',
                      style: TextStyle(
                          fontFamily: 'Montserrat SemiBold',
                          fontSize: screenHeight * 0.0215,
                          fontWeight: FontWeight.w800),
                    ),
                    SizedBox(
                      height: screenHeight * 0.045,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.126),
                      child: Wrap(
                        children: [
                          Text(
                            'Enter you mobile number so that we know who it is.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Archivo',
                              fontSize: screenHeight * 0.019,
                              fontWeight: FontWeight.w400,
                              color: const Color.fromRGBO(99, 99, 99, 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.039,
                    ),
                    SizedBox(
                      height: screenHeight * 0.056,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: mobileController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.04,
                              vertical: screenHeight * 0.015),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Color(0XFFE0E0E0)),
                              borderRadius: BorderRadius.circular(8)),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Color(0XFFE0E0E0)),
                              borderRadius: BorderRadius.circular(8)),
                          hintText: 'Mobile No.',
                          hintStyle: TextStyle(
                            fontFamily: 'Archivo',
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(166, 157, 157, 1),
                            fontSize: screenHeight * 0.015,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.05,
                    ),
                    PrimaryButton(
                      onPress: () {
                        _getUserData(mobileController.text);
                        if (userData != null) {
                          sendOtp(context, mobileController.text);
                          Navigator.pushNamed(context, '/third');
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Not registered")));
                        }
                      },
                      label: 'Send OTP',
                    ),
                  ],
                ),
                Positioned(
                  top: 0.0,
                  left: 0.0,
                  child: GestureDetector(
                    child: Container(
                      height: screenHeight * 0.04,
                      width: screenWidth * 0.081,
                      decoration: BoxDecoration(
                          color: primaryColor1,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: const Icon(
                        Icons.arrow_back_ios_outlined,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/');
                    },
                  ),
                )
              ]),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.only(bottom: screenHeight * 0.067),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'New to Pick My Parcel? ',
                style: TextStyle(
                    fontFamily: 'Archivo',
                    fontWeight: FontWeight.w400,
                    fontSize: screenHeight * 0.017,
                    color: const Color.fromRGBO(137, 132, 132, 1)),
              ),
              GestureDetector(
                child: Text(
                  'Register',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Archivo',
                      fontWeight: FontWeight.w700,
                      fontSize: screenHeight * 0.017,
                      color: primaryColor1),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/fourth');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
