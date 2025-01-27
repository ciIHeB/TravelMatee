import 'package:flutter/material.dart';
import '/Splash_screen.dart';
import '/Login.dart';
import '/signup.dart';
import '/forget.dart';
import '/Home.dart';
import '/check.dart';
import 'Profile.dart';
import 'fav.dart';
import 'search.dart';
import 'istanbul.dart';
import 'booking.dart';
import 'edit.dart';
import 'paris.dart';
import 'bali.dart';
import 'sidi.dart';
import 'setting.dart';
import 'notification.dart';

void main() {
  runApp(TravelMateApp());
}

class TravelMateApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignupPage(),
        '/home': (context) => HomePage(),
        '/forget': (context) => ForgetPage(),
        '/verify': (context) => VerifyPage(),
        '/search': (context) => SearchPage(),
        '/profile': (context) => ProfilePage(),
        '/fav': (context) => FavPage(),
        '/destination_details': (context) => DestinationDetailsPage(),
        '/edit': (context) => EditProfilePage(), // Add this line
        '/booking': (context) => BookingPage(), // A
        '/paris': (context) => parispage(),
        '/bali': (context) => balipage(),
        '/sidi': (context) => sidipage(),
        '/setting':(context)=> settp(),
        '/notp':(context)=> notp(),
      },
    );
  }
}
