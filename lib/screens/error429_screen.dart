import 'package:flutter/material.dart';
import 'package:pick_my_parcel_customer/util/primary_button.dart';
import 'package:pick_my_parcel_customer/widgets/bottom_navigation_bar.dart';

class Error429Screen extends StatelessWidget {

  const Error429Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const CustomBottomBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: screenHeight * 0.263,
            ),
            const Image(
              image: AssetImage('images/Error 429.png'),
              height: 300.0,
              width: 300.0,
            ),
            SizedBox(
              height: screenHeight * 0.105,
            ),
            PrimaryButton(onPress: () {
              Navigator.pushNamed(context, '/fifth');
            }, label: 'Go Home')
          ],
        ),
      ),
    );
  }
}
