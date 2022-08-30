import 'package:flutter/material.dart';

class AddressInputBox extends StatelessWidget {
  final String type;
  final TextEditingController controller;

  const AddressInputBox({Key? key, required this.type, required this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 321.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xffE0E0E0), width: 1.0),
        color: Colors.white,
      ),
      child: TextFormField(
        maxLines: 3,
        style: const TextStyle(
          fontFamily: 'PT Sans',
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 9.0, vertical: 15.0),
          hintText: type + ' Address',
          hintStyle: const TextStyle(
            fontFamily: 'PT Sans',
            fontWeight: FontWeight.w400,
            fontSize: 14.0,
            color: Color(0xffB8B8B8),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffE0E0E0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(
              color: Color(0xffE0E0E0),
            ),
          ),
          suffixIcon: Image(
            image: AssetImage('images/pin.png'),
          ),
          suffixIconConstraints: BoxConstraints(
            maxHeight: 30.0,
            maxWidth: 30.0,
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
      ),
    );
  }
}
