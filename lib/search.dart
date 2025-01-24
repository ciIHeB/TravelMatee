import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
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
              "Search",
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search for destinations, hotels, or attractions...',
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              ),
            ),
            SizedBox(height: 20), // Space between search bar and results
            // Search Results Section
            Expanded(
              child: ListView(
                children: [
                  // Placeholder for search results
                  ListTile(
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
                    subtitle: Text(
                      'Discover the beauty of Bali',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                    onTap: () {
                      Navigator.pushNamed(context, '/destination_details');
                    },
                  ),
                  Divider(thickness: 1),
                  ListTile(
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
                    subtitle: Text(
                      'Experience the charm of Santorini',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                    onTap: () {
                      Navigator.pushNamed(context, '/destination_details');
                    },
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
        currentIndex: 1, // Set "Search" as active
        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, '/home'); // Navigate to Home page
          } else if (index == 2) {
            Navigator.pushNamed(context, '/fav'); // Navigate to Favorites page
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
