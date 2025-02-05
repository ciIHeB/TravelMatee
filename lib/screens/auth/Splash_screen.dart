import 'package:flutter/material.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () 
    {
      final User? user = FirebaseAuth.instance.currentUser;
      if (user == null) 
      {
        Navigator.pushReplacementNamed(context, '/login');
      } else 
      {
        Navigator.pushReplacementNamed(context, '/home');
      }
    }
    );

    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.airplanemode_active, size: 100, color: Colors.white),
            SizedBox(height: 20),
            Text(
              'Welcome to TravelMate',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
