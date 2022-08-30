import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pick_my_parcel_customer/constants/constants.dart';
import '../util/primary_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  Future<void> sendOtp1(BuildContext context, String number) async {
    String phone = "+91" + number.trim();

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (PhoneAuthCredential credential) async {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) async {
        Navigator.pushNamed(context, '/third', arguments: {
          'verificationId': verificationId,
          'name': nameController.text,
          'address': addressController.text,
          'phone': phone,
          'email': emailController.text,
          'uid': FirebaseAuth.instance.currentUser?.uid
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                top: screenHeight * 0.034,
                left: screenWidth * 0.079,
                right: screenWidth * 0.079),
            child: Stack(
              children: [
                Column(children: [
                  SizedBox(
                    height: screenHeight * 0.022,
                  ),
                  SizedBox(
                    height: screenHeight * 0.28,
                    width: screenWidth * 0.61,
                    child: Image.asset('images/signup.png'),
                  ),
                  SizedBox(
                    height: screenHeight * 0.030,
                  ),
                  Text(
                    'Sign Up',
                    style: TextStyle(
                        fontFamily: 'Montserrat SemiBold',
                        fontSize: screenHeight * 0.0215,
                        fontWeight: FontWeight.w800),
                  ),
                  SizedBox(
                    height: screenHeight * 0.035,
                  ),
                  Text(
                    'Let’s get to know you better',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Archivo',
                      fontSize: screenHeight * 0.019,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(99, 99, 99, 1),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.039,
                  ),
                  SizedBox(
                    height: screenHeight * 0.056,
                    child: TextField(
                      controller: nameController,
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
                        hintText: 'Name',
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
                    height: screenHeight * 0.011,
                  ),
                  SizedBox(
                    height: screenHeight * 0.056,
                    child: TextField(
                      controller: addressController,
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
                        hintText: 'Address',
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
                    height: screenHeight * 0.011,
                  ),
                  SizedBox(
                    height: screenHeight * 0.056,
                    child: TextField(
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
                    height: screenHeight * 0.011,
                  ),
                  SizedBox(
                    height: screenHeight * 0.056,
                    child: TextField(
                      controller: emailController,
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
                        hintText: 'Email',
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
                    height: screenHeight * 0.04,
                  ),
                  PrimaryButton(
                    onPress: () {
                      sendOtp1(context, mobileController.text);
                    },
                    label: 'Send OTP',
                  ),
                  Container(
                    padding: EdgeInsets.only(top: screenHeight * 0.047),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already a user? ',
                          style: TextStyle(
                              fontFamily: 'Archivo',
                              fontWeight: FontWeight.w400,
                              fontSize: screenHeight * 0.017,
                              color: const Color.fromRGBO(137, 132, 132, 1)),
                        ),
                        GestureDetector(
                          child: Text(
                            'Sign In',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Archivo',
                                fontWeight: FontWeight.w700,
                                fontSize: screenHeight * 0.017,
                                color: primaryColor1),
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, '/second');
                          },
                        ),
                      ],
                    ),
                  )
                ]),
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
                      Navigator.pop(context);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
