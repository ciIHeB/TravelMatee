import 'package:flutter/material.dart';

class FavPage extends StatelessWidget {
  

Widget build(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
   return Scaffold(
      appBar: AppBar(
         automaticallyImplyLeading: false, // Rem
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Logo
            Image.asset(
              'assets/llogo.png',
              width: screenWidth * 0.1, // Adjust logo size
              height: screenWidth * 0.1,
            ),
            SizedBox(width: 10), // Space between logo and text
            // "TravelMate" Text
            Text(
              " Fav",
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
          children: [
             
            SizedBox(height: 30),
          
            SizedBox(height: 10),
            ListTile(
              leading: Image.asset('assets/your_actual_image_name.jpg', width: 70),
              title: Text('Bali, Indonesia'),
              subtitle: Text('Visited March 2025'),
            ),
            Divider(),
            ListTile(
              leading: Image.asset('assets/your_actual_image_name.jpg', width: 70),
              title: Text('Santorini, Greece'),
              subtitle: Text('Visited January 2025'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1, 
        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, '/home');
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
