import 'package:flutter/material.dart';
import 'package:pick_my_parcel_customer/constants/constants.dart';

class DropDownSelector extends StatefulWidget {
  final List<String> listItems;
  final String? selectedItem;
  final double width;
  final double height;
  const DropDownSelector(
      {required this.listItems,
      required this.selectedItem,
      required this.width,
      required this.height,
      Key? key})
      : super(key: key);

  @override
  _DropDownSelectorState createState() => _DropDownSelectorState();
}

class _DropDownSelectorState extends State<DropDownSelector> {
  String selectedItems = '';

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    selectedItems = widget.selectedItem.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: const Color(0xffE0E0E0), width: 1.0),
        color: Colors.white,
      ),
      child: DropdownButton<String>(
          value: selectedItems,
          isExpanded: true,
          dropdownColor: Colors.white,
          icon: const Icon(
            Icons.keyboard_arrow_down_rounded,
            size: 15.0,
            color: primaryColor1,
          ),
          underline: const SizedBox(),
          items: widget.listItems.map<DropdownMenuItem<String>>(
            (String selectedItem) {
              return DropdownMenuItem<String>(
                value: selectedItem,
                child: Text(
                  selectedItem,
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                      fontFamily: 'PT Sans',
                      fontSize: 14.0,
                      color: primaryColor1),
                ),
              );
            },
          ).toList(),
          onChanged: (String? newValue) => setState(() {
                selectedItems = newValue!;
              })),
    );
  }
}
