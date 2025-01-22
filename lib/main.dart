import 'package:flutter/material.dart';
import '/Splash_screen.dart';
import '/Login.dart';
import '/signup.dart';
 
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
        
      },
    );
  }
}
