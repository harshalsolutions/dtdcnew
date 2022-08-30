import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants/constants.dart';

enum Time {AM, PM}

class PickupTimeBuilder extends StatefulWidget {
  final double screenHeight;
  final double screenWidth;
  const PickupTimeBuilder({Key? key, required this.screenHeight, required this.screenWidth}) : super(key: key);

  @override
  State<PickupTimeBuilder> createState() => _PickupTimeBuilderState();
}

class _PickupTimeBuilderState extends State<PickupTimeBuilder> {
  Time selectedTime = Time.AM;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.screenWidth * 0.046),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Schedule Pickup Time',
            style: TextStyle(
                fontFamily: 'Archivo',
                fontWeight: FontWeight.w500,
                fontSize: widget.screenHeight * 0.018,
                color: primaryColor1
            ),
          ),
          SizedBox(
            height: widget.screenHeight * 0.04,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: widget.screenWidth * 0.143,
                      maxHeight: widget.screenHeight * 0.055,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.8),
                      border: Border.all(color: Colors.black, width: 1.0),
                      color: primaryColor1,
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      initialValue: '12',
                      inputFormatters: [
                        NumericalRangeFormatter(min: 1, max: 12)
                      ],
                      style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: widget.screenHeight * 0.02,
                          fontWeight: FontWeight.w900,
                          color: Colors.white
                      ),
                      decoration: InputDecoration(
                          filled: true,
                          contentPadding:
                          EdgeInsets.only(left: widget.screenWidth * 0.042,  bottom: widget.screenHeight * 0.0056),),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: widget.screenHeight * 0.01,
                  ),
                  Text('Hours',
                    style: TextStyle(
                        fontFamily: 'Archivo',
                        fontWeight: FontWeight.w300,
                        fontSize: widget.screenHeight * 0.018
                    ),)
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: widget.screenHeight * 0.012, horizontal: widget.screenWidth * 0.0116),
                child: Text(':',
                  style: TextStyle(
                      fontSize: widget.screenHeight * 0.019,
                      fontWeight: FontWeight.w900
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: widget.screenWidth * 0.143,
                      maxHeight: widget.screenHeight * 0.055,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.8),
                      border: Border.all(color: Colors.black, width: 1.0),
                      color: primaryColor1,
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      initialValue: '00',
                      inputFormatters: [
                        NumericalRangeFormatter(min: 0, max: 60)
                      ],
                      style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: widget.screenHeight * 0.02,
                          fontWeight: FontWeight.w900,
                          color: Colors.white
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        contentPadding:
                        EdgeInsets.only(left: widget.screenWidth * 0.042, bottom: widget.screenHeight * 0.0056),),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: widget.screenHeight * 0.01,
                  ),
                  Text('Minutes',
                    style: TextStyle(
                        fontFamily: 'Archivo',
                        fontWeight: FontWeight.w300,
                        fontSize: widget.screenHeight * 0.018
                    ),)
                ],
              ),
              SizedBox(
                width: widget.screenWidth * 0.147,
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTime = Time.AM;
                      });
                    },
                    child: Text('AM',
                      style: TextStyle(
                          fontFamily: 'Archivo',
                          fontSize: widget.screenHeight * 0.02,
                          fontWeight: (selectedTime == Time.AM)
                              ? FontWeight.w900
                              : FontWeight.w500
                      ),
                    ),
                  ),
                  SizedBox(
                    height: widget.screenHeight * 0.01,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTime = Time.PM;
                      });
                    },
                    child: Text('PM',
                      style: TextStyle(
                          fontFamily: 'Archivo',
                          fontSize: widget.screenHeight * 0.02,
                          fontWeight: (selectedTime == Time.PM)
                              ? FontWeight.w900
                              : FontWeight.w500
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

class NumericalRangeFormatter extends TextInputFormatter {
  final int min;
  final int max;

  NumericalRangeFormatter({required this.min, required this.max});

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {

    if (newValue.text == '') {
      return newValue;
    } else if (int.parse(newValue.text) < min) {
      return const TextEditingValue().copyWith(text: min.toStringAsFixed(0));
    } else {
      return int.parse(newValue.text) > max ? oldValue : newValue;
    }
  }
}