import 'dart:async';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../constants/constants.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  int timeLeft = 59;

  void _startCountdown() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          if (timeLeft > 0) {
            timeLeft--;
          } else {
            timer.cancel();
          }
        });
      }
    });
  }

  void _resetTimer() {
    timeLeft = 59;
    _startCountdown();
  }

  List<String> currentPin = ['', '', '', '', '', ''];
  final TextEditingController _pin1 = TextEditingController();
  final TextEditingController _pin2 = TextEditingController();
  final TextEditingController _pin3 = TextEditingController();
  final TextEditingController _pin4 = TextEditingController();
  final TextEditingController _pin5 = TextEditingController();
  final TextEditingController _pin6 = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  var outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.0),
    borderSide: const BorderSide(color: Colors.black, width: 4.0),
  );

  int pinIndex = 0;
  var otpText;

  buildNumberPad() {
    return Expanded(
        child: Container(
      color: const Color(0xffF9F9F9),
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: 50.0, bottom: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  KeyboardNumber(
                      onPressed: () {
                        pinIndexSetup('1');
                      },
                      n: 1),
                  KeyboardNumber(
                      onPressed: () {
                        pinIndexSetup('2');
                      },
                      n: 2),
                  KeyboardNumber(
                      onPressed: () {
                        pinIndexSetup('3');
                      },
                      n: 3),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  KeyboardNumber(
                      onPressed: () {
                        pinIndexSetup('4');
                      },
                      n: 4),
                  KeyboardNumber(
                      onPressed: () {
                        pinIndexSetup('5');
                      },
                      n: 5),
                  KeyboardNumber(
                      onPressed: () {
                        pinIndexSetup('6');
                      },
                      n: 6),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  KeyboardNumber(
                      onPressed: () {
                        pinIndexSetup('7');
                      },
                      n: 7),
                  KeyboardNumber(
                      onPressed: () {
                        pinIndexSetup('8');
                      },
                      n: 8),
                  KeyboardNumber(
                      onPressed: () {
                        pinIndexSetup('9');
                      },
                      n: 9),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 60.0,
                    child: MaterialButton(
                      color: Colors.white,
                      height: 60.0,
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60.0),
                      ),
                      onPressed: () {
                        if (otpText != '') {
                          verifyUser(context, otpText, args['verificationId']);
                        }
                        // if (_pin6.text != '') {
                        //   Navigator.pushNamed(context, '/fifth');
                        //   _pin1.clear();
                        //   _pin2.clear();
                        //   _pin3.clear();
                        //   _pin4.clear();
                        //   _pin5.clear();
                        //   _pin6.clear();
                        // }
                      },
                      child: const Icon(
                        Icons.check,
                        color: primaryColor1,
                      ),
                    ),
                  ),
                  KeyboardNumber(
                      onPressed: () {
                        pinIndexSetup('0');
                      },
                      n: 0),
                  SizedBox(
                    width: 60.0,
                    child: MaterialButton(
                      color: Colors.white,
                      elevation: 0.0,
                      height: 60.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60.0),
                      ),
                      onPressed: () {
                        clearPin();
                      },
                      child: const Icon(Icons.backspace_outlined),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }

  clearPin() {
    if (pinIndex == 0) {
      pinIndex = 0;
    } else if (pinIndex <= 6 && pinIndex >= 1) {
      setPin(pinIndex, '');
      currentPin[pinIndex - 1] = '';
      pinIndex--;
    }
  }

  pinIndexSetup(String text) {
    if (pinIndex == 0) {
      pinIndex = 1;
    } else if (pinIndex < 6) {
      pinIndex++;
    }
    setPin(pinIndex, text);
    String strPin = '';
    for (var e in currentPin) {
      strPin += e;
    }
    if (pinIndex == 6) {}
  }

  setPin(int n, String text) {
    switch (n) {
      case 1:
        _pin1.text = text;
        break;
      case 2:
        _pin2.text = text;
        break;
      case 3:
        _pin3.text = text;
        break;
      case 4:
        _pin4.text = text;
        break;
      case 5:
        _pin5.text = text;
        break;
      case 6:
        _pin6.text = text;
        break;
    }
  }

  buildPinRow() {
    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.95,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PINNumber(
              textEditingController: _pin1,
              outlineInputBorder: outlineInputBorder,
            ),
            PINNumber(
              textEditingController: _pin2,
              outlineInputBorder: outlineInputBorder,
            ),
            PINNumber(
              textEditingController: _pin3,
              outlineInputBorder: outlineInputBorder,
            ),
            PINNumber(
              textEditingController: _pin4,
              outlineInputBorder: outlineInputBorder,
            ),
            PINNumber(
              textEditingController: _pin5,
              outlineInputBorder: outlineInputBorder,
            ),
            PINNumber(
              textEditingController: _pin6,
              outlineInputBorder: outlineInputBorder,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  Future<void> sendOtp(BuildContext context, String number) async {
    String phone = number.trim();

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (PhoneAuthCredential credential) async {

      },
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) async {
        Navigator.pushNamed(context, '/third',
            arguments: {'verificationId': verificationId, 'phone': phone});
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }


  var args = {};

  Future<void> verifyUser(
      BuildContext context, String otpCode, String verificationId) async {
    String otp = otpCode.trim();

    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: otp);
    try {
      await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) async {
        if (value.user != null) {
          Map<String, dynamic> userDetails = {
            "name": args['name'] ?? "",
            "address": args['address'] ?? "",
            "phone": args['phone']??"",
            "email": args['email']??"",
            'uid':FirebaseAuth.instance.currentUser?.uid??"",
            "image":
                "https://images.unsplash.com/photo-1621972750749-0fbb1abb7736?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8Y291cmllciUyMHNlcnZpY2VzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
          };
          FirebaseFirestore.instance
              .collection("Users")
              .where("phone", isEqualTo: args['phone'])
              .get()
              .then((values) {
            if (values.docs.isEmpty) {
              FirebaseFirestore.instance
                  .collection("Users")
                  .doc(value.user!.uid.substring(0, 20))
                  .set(userDetails)
                  .then((value) {
                //Change Screen
                Navigator.pushNamed(context, '/fifth', arguments: {});
              });
            } else {
              Navigator.pushNamed(context, '/fifth', arguments: {});
            }
          });
        }
      });
    } on FirebaseAuthException catch (ex) {
      log(ex.code.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    args = ModalRoute.of(context)!.settings.arguments as Map;

    setState(() {
      otpText = _pin1.text +
          _pin2.text +
          _pin3.text +
          _pin4.text +
          _pin5.text +
          _pin6.text;
    });

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        bottom: false,
        child: Center(
          child: Stack(children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: screenHeight * 0.034,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: screenHeight * 0.045,
                      ),
                      Text(
                        'Verify Your Number',
                        style: TextStyle(
                            fontFamily: 'Montserrat SemiBold',
                            fontSize: screenHeight * 0.0215,
                            fontWeight: FontWeight.w800),
                      ),
                      SizedBox(
                        height: screenHeight * 0.045,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.126),
                        child: Wrap(
                          children: [
                            Text(
                              'Enter 6-digit code sent at your number',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Archivo',
                                fontSize: screenHeight * 0.017,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.095,
                      ),
                      buildPinRow(),
                      SizedBox(
                        height: screenHeight * 0.027,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            timeLeft == 0
                                ? 'Didn’t receive an OTP? '
                                : 'Resend OTP ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Archivo',
                              fontSize: screenHeight * 0.019,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (timeLeft == 0) {
                                  _resetTimer();
                                  sendOtp(context, args['phone']);
                                }
                              });
                            },
                            child: Text(
                              timeLeft != 0
                                  ? (timeLeft < 10
                                      ? ' 00:0' + timeLeft.toString()
                                      : ' 00:' + timeLeft.toString())
                                  : 'Resend OTP',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  decoration: timeLeft == 0
                                      ? TextDecoration.underline
                                      : TextDecoration.none,
                                  fontFamily: 'Archivo',
                                  fontSize: screenHeight * 0.019,
                                  fontWeight: FontWeight.w400,
                                  color: primaryColor1),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: screenHeight * 0.160,
                      ),
                    ],
                  ),
                ),
                buildNumberPad(),
              ],
            ),
            Positioned(
              top: screenHeight * 0.034,
              left: screenWidth * 0.079,
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
                  setState(() {
                    Navigator.pop(context);
                  });
                },
              ),
            )
          ]),
        ),
      ),
    );
  }
}

class PINNumber extends StatelessWidget {
  final TextEditingController textEditingController;
  final OutlineInputBorder outlineInputBorder;

  const PINNumber(
      {required this.textEditingController, required this.outlineInputBorder});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
      width: 50.0,
      height: 50.0,
      child: TextField(
        controller: textEditingController,
        enabled: false,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          border: outlineInputBorder,
          filled: true,
          fillColor: Colors.white30,
        ),
      ),
    );
  }
}

class KeyboardNumber extends StatelessWidget {
  final int n;
  final Function() onPressed;

  const KeyboardNumber({required this.onPressed, required this.n});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      width: 60.0,
      height: 60.0,
      alignment: Alignment.center,
      child: MaterialButton(
        onPressed: onPressed,
        height: 50.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Text(
          '$n',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Archivo',
            fontWeight: FontWeight.w300,
            fontSize: MediaQuery.of(context).size.height * 0.029,
          ),
        ),
      ),
    );
  }
}
