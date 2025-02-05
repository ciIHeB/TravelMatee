import 'package:flutter/material.dart';
import 'screens/auth/Splash_screen.dart';
import 'screens/auth/Login.dart';
import 'screens/auth/signup.dart';
import 'screens/auth/forget.dart';
import 'screens/home/Home.dart';
import 'screens/auth/check.dart';
import 'screens/home/Profile.dart';
import 'screens/home/fav.dart';
import 'screens/home/search.dart';
import 'screens/destinations/istanbul.dart';
import 'screens/booking/booking.dart';
import 'screens/edit/edit.dart';
import 'screens/destinations/paris.dart';
import 'screens/destinations/bali.dart';
import 'screens/destinations/sidi.dart';
import 'screens/settings/setting.dart';
import 'screens/settings/notification.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
    print("Firebase initialized: ${Firebase.app().options}");
  } catch (e) {
    print("Error initializing Firebase: $e");
  }
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
        '/edit': (context) => EditProfilePage(),
        '/booking': (context) => BookingPage(),
        '/paris': (context) => parispage(),
        '/bali': (context) => balipage(),
        '/sidi': (context) => sidipage(),
        '/setting': (context) => settp(),
        '/notp': (context) => notp(),
      },
    );
  }
}
