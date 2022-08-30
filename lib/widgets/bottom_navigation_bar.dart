import 'package:flutter/material.dart';
import 'package:pick_my_parcel_customer/widgets/menu_bottom_sheet.dart';
import '../constants/constants.dart';

enum Menu {home, cart, track}
Menu selectedMenu = Menu.home;

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({Key? key}) : super(key: key);

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(
          left: screenWidth * 0.046,
          right: screenWidth * 0.046,
          bottom: screenHeight * 0.0169),
      height: screenHeight * 0.0812,
      decoration: BoxDecoration(
          color: primaryColor1,
          borderRadius: BorderRadius.circular(screenHeight * 0.033)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                Navigator.pushNamed(context, '/fifth');
                selectedMenu = Menu.home;
              });
            },
            child: Container(
              height: 40.0,
              width: 40.0,
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: (ModalRoute.of(context)!.settings.name == '/fifth' || ModalRoute.of(context)!.settings.name == '/sixth')
                      ? primaryColor4
                      : primaryColor1,
                  borderRadius: BorderRadius.circular(20.0)
              ),
              child: Image.asset(
                (ModalRoute.of(context)!.settings.name == '/fifth' || ModalRoute.of(context)!.settings.name == '/sixth')
                    ? 'images/fi-sr-home.png'
                    : 'images/homes.png',
                color: (ModalRoute.of(context)!.settings.name == '/fifth' || ModalRoute.of(context)!.settings.name == '/sixth')
                    ? Colors.white
                    : Colors.black,
                height: 20.0,
                width: 20.0,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                selectedMenu = Menu.cart;
                Navigator.pushNamed(context, '/thirteenth');
              });
            },
            child: Container(
              height: 40.0,
              width: 40.0,
              padding: const EdgeInsets.all(9.0),
              decoration: BoxDecoration(
                  color: (ModalRoute.of(context)!.settings.name == '/thirteenth')
                      ? primaryColor4
                      : primaryColor1,
                  borderRadius: BorderRadius.circular(20.0)
              ),
              child: Icon(
                  Icons.shopping_cart_outlined,
                color: (ModalRoute.of(context)!.settings.name == '/thirteenth')
                    ? Colors.white
                    : Colors.black,
                ),
              ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                selectedMenu = Menu.track;
                Navigator.pushNamed(context, '/orderCompleted');
              });
            },
            child: Container(
              height: 40.0,
              width: 40.0,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  color: (ModalRoute.of(context)!.settings.name == '/eleventh')
                      ? primaryColor4
                      : primaryColor1,
                  borderRadius: BorderRadius.circular(20.0)
              ),
              child: Icon(
                Icons.map_outlined,
                color: (ModalRoute.of(context)!.settings.name == '/eleventh')
                    ? Colors.white
                    : Colors.black,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30.0)
                  ),
                ),
                builder: (context) =>
                     OpenBottomSheet(
                      screenHeight: screenHeight,
                      screenWidth: screenWidth,
                    )
              );
            },
            child: Container(
              height: 40.0,
              width: 40.0,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  color: primaryColor1,
                  borderRadius: BorderRadius.circular(20.0)
              ),
              child: const Icon(
                Icons.menu_rounded,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
