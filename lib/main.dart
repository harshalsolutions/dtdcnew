import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pick_my_parcel_customer/adddata.dart';
import 'package:pick_my_parcel_customer/providers/order_provider.dart';
import 'package:pick_my_parcel_customer/providers/user_provider.dart';
import 'package:pick_my_parcel_customer/providers/vendor_provider.dart';
import 'package:pick_my_parcel_customer/screens/error404_screen.dart';
import 'package:pick_my_parcel_customer/screens/error429_screen.dart';
import 'package:pick_my_parcel_customer/screens/my_orders_screen.dart';
import 'package:pick_my_parcel_customer/screens/order_completed_screen.dart';
import 'package:pick_my_parcel_customer/screens/profile_screen.dart';
import 'package:pick_my_parcel_customer/screens/home_screen.dart';
import 'package:pick_my_parcel_customer/screens/landing_screen.dart';
import 'package:pick_my_parcel_customer/screens/otpscreen.dart';
import 'package:pick_my_parcel_customer/screens/place_order_details_screen.dart';
import 'package:pick_my_parcel_customer/screens/ratings_feedback_screen.dart';
import 'package:pick_my_parcel_customer/screens/sign_in_screen.dart';
import 'package:pick_my_parcel_customer/screens/sign_up_screen.dart';
import 'package:pick_my_parcel_customer/screens/tncscreen.dart';
import 'package:pick_my_parcel_customer/screens/track_courier_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ErrorWidget.builder = (FlutterErrorDetails details) => const Error429Screen();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    // return MaterialApp(
    //   home: ADDData(),
    // );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<OrderProvider>(
            create: (context) => OrderProvider()),
        ChangeNotifierProvider<VendorProvider>(
            create: (context) => VendorProvider()),
        ChangeNotifierProvider<UserProvider>(
            create: (context) => UserProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) =>
              user == null ? const LandingScreen() : const HomeScreen(),
          '/second': (context) => const LoginScreen(),
          '/third': (context) => const OTPScreen(),
          '/fourth': (context) => const SignUpScreen(),
          '/fifth': (context) => const HomeScreen(),
          '/sixth': (context) => const PlaceOrderDetails(),
          '/eleventh': (context) => const TrackYourCourierScreen(),
          '/thirteenth': (context) => const MyOrdersScreen(),
          '/fourteenth': (context) => const TermsAndConditionsScreen(),
          '/fifteenth': (context) => const ProfileScreen(),
          '/sixteenth': (context) => const RatingsAndFeedbackScreen(),
          '/orderCompleted': (context) => const OrderCompletedScreen(),
        },
        onUnknownRoute: (settings) {
          return MaterialPageRoute(
            builder: (context) => const Error404Screen(),
          );
        },
      ),
    );
  }
}
