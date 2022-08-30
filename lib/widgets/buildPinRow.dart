// import 'package:flutter/material.dart';
//
// import '../constants/constants.dart';
//
// class BuildPinRow extends StatefulWidget {
//   const BuildPinRow({Key? key}) : super(key: key);
//
//
//   @override
//   _BuildPinRowState createState() => _BuildPinRowState();
// }
//
// class _BuildPinRowState extends State<BuildPinRow> {
//
//   List<String> currentPin = ['', '', '', ''];
//
//   int pinIndex = 0;
//
//   TextEditingController pinOneController = TextEditingController();
//   TextEditingController pinTwoController = TextEditingController();
//   TextEditingController pinThreeController = TextEditingController();
//   TextEditingController pinFourController = TextEditingController();
//
//   var outlineInputBorder = OutlineInputBorder(
//     borderRadius: BorderRadius.circular(10.0),
//     borderSide: const BorderSide(color: Colors.transparent),
//   );
//
//   clearPin() {
//     if (pinIndex == 0) {
//       pinIndex = 0;
//     } else if (pinIndex <= 4 && pinIndex >= 1) {
//       setPin(pinIndex, '');
//       currentPin[pinIndex - 1] = '';
//       pinIndex--;
//     }
//   }
//
//   pinIndexSetup(String text) {
//     if (pinIndex == 0) {
//       pinIndex = 1;
//     } else if (pinIndex < 4) {
//       pinIndex++;
//     }
//     setPin(pinIndex, text);
//     String strPin = '';
//     for (var e in currentPin) {
//       strPin += e;
//     }
//     if (pinIndex == 4) {
//       print(strPin);
//     }
//   }
//
//   setPin(int n, String text) {
//     switch (n) {
//       case 1:
//         pinOneController.text = text;
//         break;
//       case 2:
//         pinTwoController.text = text;
//         break;
//       case 3:
//         pinThreeController.text = text;
//         break;
//       case 4:
//         pinFourController.text = text;
//         break;
//     }
//   }
//
//   buildNumberPad() {
//     return Expanded(
//         child: Container(
//           color: Colors.grey,
//           alignment: Alignment.bottomCenter,
//           child: Padding(
//             padding: const EdgeInsets.only(top: 50.0, bottom: 20),
//             child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     KeyboardNumber(
//                         onPressed: () {
//                           pinIndexSetup('1');
//                         },
//                         n: 1),
//                     KeyboardNumber(
//                         onPressed: () {
//                           pinIndexSetup('2');
//                         },
//                         n: 2),
//                     KeyboardNumber(
//                         onPressed: () {
//                           pinIndexSetup('3');
//                         },
//                         n: 3),
//                   ],
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     KeyboardNumber(
//                         onPressed: () {
//                           pinIndexSetup('4');
//                         },
//                         n: 4),
//                     KeyboardNumber(
//                         onPressed: () {
//                           pinIndexSetup('5');
//                         },
//                         n: 5),
//                     KeyboardNumber(
//                         onPressed: () {
//                           pinIndexSetup('6');
//                         },
//                         n: 6),
//                   ],
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     KeyboardNumber(
//                         onPressed: () {
//                           pinIndexSetup('7');
//                         },
//                         n: 7),
//                     KeyboardNumber(
//                         onPressed: () {
//                           pinIndexSetup('8');
//                         },
//                         n: 8),
//                     KeyboardNumber(
//                         onPressed: () {
//                           pinIndexSetup('9');
//                         },
//                         n: 9),
//                   ],
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Container(
//                       width: 60.0,
//                       child: MaterialButton(
//                         height: 60.0,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(60.0),
//                           side: const BorderSide(color: Colors.white),
//                         ),
//                         onPressed: () {},
//                         child: const Icon(
//                           Icons.check,
//                           color: primaryColor1,
//                         ),
//                       ),
//                     ),
//                     KeyboardNumber(
//                         onPressed: () {
//                           pinIndexSetup('0');
//                         },
//                         n: 0),
//                     Container(
//                       width: 60.0,
//                       child: MaterialButton(
//                         height: 60.0,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(60.0),
//                           side: const BorderSide(color: Colors.white),
//                         ),
//                         onPressed: () {
//                           clearPin();
//                         },
//                         child: const Icon(Icons.backspace_outlined),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         PINNumber(
//           textEditingController: pinOneController,
//           outlineInputBorder: outlineInputBorder,
//         ),
//         PINNumber(
//           textEditingController: pinTwoController,
//           outlineInputBorder: outlineInputBorder,
//         ),
//         PINNumber(
//           textEditingController: pinThreeController,
//           outlineInputBorder: outlineInputBorder,
//         ),
//         PINNumber(
//           textEditingController: pinFourController,
//           outlineInputBorder: outlineInputBorder,
//         )
//       ],
//     );
//   }
// }
//
// class PINNumber extends StatelessWidget {
//   final TextEditingController textEditingController;
//   final OutlineInputBorder outlineInputBorder;
//   const PINNumber(
//       {required this.textEditingController, required this.outlineInputBorder});
//
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 50.0,
//       child: TextField(
//         controller: textEditingController,
//         enabled: false,
//         textAlign: TextAlign.center,
//         decoration: InputDecoration(
//           contentPadding: EdgeInsets.all(16.0),
//           border: outlineInputBorder,
//           filled: true,
//           fillColor: Colors.white30,
//         ),
//       ),
//     );
//   }
// }
//
// class KeyboardNumber extends StatelessWidget {
//   final int n;
//   final Function() onPressed;
//   const KeyboardNumber({required this.onPressed, required this.n});
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 60.0,
//       height: 60.0,
//       alignment: Alignment.center,
//       child: MaterialButton(
//         padding: EdgeInsets.all(8.0),
//         onPressed: onPressed,
//         height: 90.0,
//         child: Text(
//           '$n',
//           textAlign: TextAlign.center,
//           style: TextStyle(
//             fontFamily: 'Archivo',
//             fontWeight: FontWeight.w300,
//             fontSize: MediaQuery.of(context).size.height * 0.029,
//           ),
//         ),
//       ),
//     );
//   }
// }
//
