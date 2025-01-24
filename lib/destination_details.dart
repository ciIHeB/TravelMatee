import 'package:flutter/material.dart';

class DestinationDetailsPage extends StatelessWidget {
  @override
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
            // "Search" Text
            Text(
              "Detail Destination",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white, // White background for AppBar
        elevation: 1, // Add shadow for better separation
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(color: Colors.black), // Icon color
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () {


              
            },
          ),
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/destination_image.jpg',
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Bali Paradise Resort",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow),
                      Text(" 4.8 • 2,145 reviews"),
                      Spacer(),
                      Text(
                        "\$299 /night",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Amenities',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.wifi, color: Colors.blue),
                      SizedBox(width: 10),
                      Text("Free WiFi"),
                      SizedBox(width: 20),
                      Icon(Icons.pool, color: Colors.blue),
                      SizedBox(width: 10),
                      Text("Pool"),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Experience luxury living in our beautiful resort nestled in the heart of Bali. Featuring stunning infinity pools, world-class spa facilities, and breathtaking views of the surrounding rice terraces.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                   GestureDetector(
                    onTap: () 
                    {
                      // Validate the form and navigate if valid
                       
                      
                        Navigator.pushNamed(context, '/booking');
                      
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 120, vertical: 12),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF4F58FD), Color(0xFF149BF3)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Text(
                        "Book Now",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white, // White background for the navbar
        selectedItemColor: const Color.fromARGB(255, 52, 27, 97), // Selected item color
        unselectedItemColor: Colors.grey, // Unselected items color
  
        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, '/home'); // Navigate to Home page
          } else if (index == 2) {
            Navigator.pushNamed(context, '/fav'); // Navigate to Favorites page
          } else if (index == 3) {
            Navigator.pushNamed(context, '/profile'); // Navigate to Profile page
          }
          else if (index == 1) {
            Navigator.pushNamed(context, '/search'); // Navigate to Profile page
          }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search_sharp), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.star_outlined), label: "Fav"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
