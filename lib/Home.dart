import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
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
              width: screenWidth * 0.1, // Adjust logo size
              height: screenWidth * 0.1,
            ),
            SizedBox(width: 10), // Space between logo and text
            // "TravelMate" Text
            Text(
              "travelmate ",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        automaticallyImplyLeading: false, // Removes the back arrow
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Popular Destinations",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              // Destination 1
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/destination_details',
                    arguments: {
                      "title": "Bali Paradise Resort",
                      "image": 'assets/llogo.png',
                      "description":
                          "Experience the perfect blend of beaches, culture, and spirituality in this tropical paradise.",
                    },
                  );
                },
                child: Card(
                  elevation: 4,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/llogo.png',
                        width: double.infinity,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Bali, Indonesia",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "Experience the perfect blend of beaches, culture, and spirituality in this tropical paradise.",
                              style: TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              // Destination 2
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/destination_details',
                    arguments: {
                      "title": "Santorini, Greece",
                      "image": 'assets/llogo.png',
                      "description":
                          "Discover stunning sunsets and iconic white architecture on this magical Greek island.",
                    },
                  );
                },
                child: Card(
                  elevation: 4,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/llogo.png',
                        width: double.infinity,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Santorini, Greece",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "Discover stunning sunsets and iconic white architecture on this magical Greek island.",
                              style: TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              // Destination 3
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/destination_details',
                    arguments: {
                      "title": "Kyoto, Japan",
                      "image": 'assets/kyoto.png',
                      "description":
                          "Explore ancient temples, serene gardens, and the captivating culture of Japan’s former imperial capital.",
                    },
                  );
                },
                child: Card(
                  elevation: 4,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/llogo.png',
                        width: double.infinity,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Kyoto, Japan",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "Explore ancient temples, serene gardens, and the captivating culture of Japan’s former imperial capital.",
                              style: TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white, // White background for the navbar
        selectedItemColor: const Color.fromARGB(255, 52, 27, 97), // Selected item color
        unselectedItemColor: Colors.grey, // Unselected items color
        currentIndex: 0, // Set "Home" as active
        onTap: (index) {
          if (index == 2) {
            Navigator.pushNamed(context, '/fav');
          } else if (index == 1) {
            Navigator.pushNamed(context, '/search'); // Navigate to Search page
          } else if (index == 3) {
            Navigator.pushNamed(context, '/profile');
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
