import 'package:flutter/material.dart';
import 'package:pick_my_parcel_customer/util/primary_button.dart';
import 'package:pick_my_parcel_customer/widgets/bottom_navigation_bar.dart';

class Error404Screen extends StatelessWidget {

  const Error404Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const CustomBottomBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: screenHeight * 0.18,
            ),
            const Image(
              image: AssetImage('images/Error 404.png'),
            ),
            SizedBox(
              height: screenHeight * 0.0338,
            ),
            SizedBox(
              width: screenWidth * 0.75,
              child: Wrap(
                children: [
                  Text(
                      'We’re sorry, the page you requested could not be found. Please go back to the homepage.',
                  textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'PT Sans',
                      fontSize: screenHeight * 0.0225,
                      fontWeight: FontWeight.w400
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: screenHeight * 0.095,
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
