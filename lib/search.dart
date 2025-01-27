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
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/home'); // Navigate to /home route
              },
              child: Image.asset(
                'assets/llogo.png',
                width: screenWidth * 0.1, // Adjust logo size
                height: screenWidth * 0.1,
              ),
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
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none), // Bell icon
            onPressed: () {
              Navigator.pushNamed(context, '/notif');
            },
          ),
        ],
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
                  // Bali, Indonesia
                  ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8), // Rounded corners
                      child: Image.asset(
                        'assets/bali.jpg',
                        width: 100, // Increased size
                        height: 80, // Increased size
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
                      'Experience the perfect blend of beaches, culture, and spirituality in this tropical paradise.',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                    onTap: () {
                      Navigator.pushNamed(context, '/bali');
                    },
                  ),
                  Divider(thickness: 1),
                  
                  // Sidi Bousaid, Tunisia
                  ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8), // Rounded corners
                      child: Image.asset(
                        'assets/Sidi.jpg',
                        width: 100, // Increased size
                        height: 80, // Increased size
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      'Sidi Bousaid, Tunisia',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Text(
                      'Discover Sidi Bou Said with stunning views, local charm, and authentic cuisine. Relax or explore—the perfect escape awaits.',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                    onTap: () {
                      Navigator.pushNamed(context, '/sidi');
                    },
                  ),
                  Divider(thickness: 1),
                  
                  // Paris, France
                  ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8), // Rounded corners
                      child: Image.asset(
                        'assets/paris.jpg',
                        width: 100, // Increased size
                        height: 80, // Increased size
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      'Paris, France',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Text(
                      'Experience Paris with elegant stays, iconic views, and exquisite cuisine. Relax or explore—the city of lights awaits.',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                    onTap: () {
                      Navigator.pushNamed(context, '/paris');
                    },
                  ),
                  Divider(thickness: 1),
                  
                  // Istanbul, Turkey
                  ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8), // Rounded corners
                      child: Image.asset(
                        'assets/istunbul.jpg',
                        width: 100, // Increased size
                        height: 80, // Increased size
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      'Istanbul, Turkey',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Text(
                      'Experience Istanbul with luxurious stays, breathtaking views, and rich culture. Relax or explore—an unforgettable adventure awaits.',
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
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: "Fav"),
          BottomNavigationBarItem(icon: Image.asset('assets/avv.png', width: 24,height: 24,), label: "Profile"),
        ],
      ),
    );
  }
}
