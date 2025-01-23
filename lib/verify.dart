import 'package:flutter/material.dart';

class VerifyPage extends StatelessWidget {
    Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: Text(
                        "  verify?",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
          ],
        ),
      ),




















    );
  }
}
