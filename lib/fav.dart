import 'package:flutter/material.dart';

class FavPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Removes the back arrow
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
            // "Fav" Text
            Text(
              "Favorites",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white, // Set white background for AppBar
        elevation: 1, // Add subtle shadow for separation
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              ' Favorite Destinations',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  // First favorite item
                  ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, '/destination_details');
                    },
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8), // Rounded corners
                      child: Image.asset(
                        'assets/your_actual_image_name.jpg',
                        width: 70,
                        height: 70,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      'Bali, Indonesia',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                  ),
                  Divider(thickness: 1),
                  // Second favorite item
                  ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, '/destination_details');
                    },
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8), // Rounded corners
                      child: Image.asset(
                        'assets/your_actual_image_name.jpg',
                        width: 70,
                        height: 70,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      'Santorini, Greece',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
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
        currentIndex: 2, // Set "Fav" as active
        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, '/home'); // Navigate to Home page
          } else if (index == 1) {
            Navigator.pushNamed(context, '/search'); // Navigate to Search page
          } else if (index == 3) {
            Navigator.pushNamed(context, '/profile'); // Navigate to Profile page
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
