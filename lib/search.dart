import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  

Widget build(BuildContext context) {
   double screenWidth = MediaQuery.of(context).size.width;
   return Scaffold(
   appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Logo
            Image.asset(
              'assets/llogo.png',
              width: screenWidth * 0.09, // Adjust logo size
              height: screenWidth * 0.1,
            ),
            SizedBox(width: 10), // Space between logo and text
            // "TravelMate" Text
            Text(
              " Search",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
         // Removes the back arrow
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
           
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
         
        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, '/home');
            } else if (index == 1) {
            Navigator.pushNamed(context, '/fav');
          
          } else if (index == 2) {
            Navigator.pushNamed(context, '/profile');
          }
        },
        items: [
          
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.star_outlined), label: "Fav "),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile "),
        ],
      ),
    );
  }
}
