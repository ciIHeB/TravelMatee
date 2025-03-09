import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'favorites_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// Import Screens
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
import 'screens/destinations/paris.dart';
import 'screens/destinations/bali.dart';
import 'screens/destinations/sidi.dart';
import 'screens/destinations/spain.dart';
import 'screens/booking/booking.dart';
import 'screens/edit/edit.dart';
import 'screens/settings/setting.dart';
import 'screens/settings/notification.dart';
import 'screens/booking/clicktopay.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
    print("✅ Firebase initialized successfully!");
  } catch (e) {
    print("❌ Error initializing Firebase: $e");
  }

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FavoritesProvider()),
      ],
      child: TravelMateApp(),
    ),
  );
}

class TravelMateApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "TravelMate",
       onGenerateRoute: (settings) {
        if (settings.name == '/booking') {
          final args = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (context) => BookingPage(basePrice: args['basePrice']),
          );
        }
        return null;
      },
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignupPage(),
        '/forget': (context) => ForgetPage(),
        '/verify': (context) => VerifyPage(),
        '/home': (context) => HomePage(),
        '/profile': (context) => ProfilePage(),
        '/fav': (context) => FavPage(),
        '/search': (context) => SearchPage(),
        '/edit': (context) => EditProfilePage(),
        '/clictopay': (context) {final totalPrice = ModalRoute.of(context)!.settings.arguments as double;return ClicToPayApp(totalPrice: totalPrice);},
        '/setting': (context) => settp(),
        '/notp': (context) => notp(),

        // Destination Routes
        '/destination_details': (context) => DestinationDetailsPage(),
        '/istanbul': (context) => DestinationDetailsPage(),
        '/paris': (context) => parispage(),
        '/bali': (context) => balipage(),
        '/sidi': (context) => sidipage(),
        '/spain': (context) => SpainPage(),
      },
    );
  }
}
