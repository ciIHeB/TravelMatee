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
        actions: [
            IconButton(
            icon: Icon(Icons.notifications_none), // Bell icon
            onPressed: () {
              Navigator.pushNamed(context, '/notp');
            },
          ),
        ],

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
                    '/bali',
                    arguments: {
                      "title": "Bali Paradise Resort",
                      "image": 'assets/bali.jpg',
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
                        'assets/bali.jpg',
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
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey),
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
                    '/sidi',
                    arguments: {
                      "title": "Sidi Bousaid, Tunis",
                      "image": 'assets/Sidi.jpg',
                      "description":
                          "Discover Sidi Bou Said with stunning views, local charm, and authentic cuisine. Relax or explore—the perfect escape awaits.",
                    },
                  );
                },
                child: Card(
                  elevation: 4,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/Sidi.jpg',
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
                              "Sidi bousaid, Tunis",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "Discover Sidi Bou Said with stunning views, local charm, and authentic cuisine. Relax or explore—the perfect escape awaits.",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey),
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
                    '/paris',
                    arguments: {
                      "title": "Paris, France",
                      "image": 'assets/paris.jpg',
                      "description":
                          "Experience Paris with elegant stays, iconic views, and exquisite cuisine. Relax or explore—the city of lights awaits.",
                    },
                  );
                },
                child: Card(
                  elevation: 4,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/paris.jpg',
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
                              "paris, France",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "Experience Paris with elegant stays, iconic views, and exquisite cuisine. Relax or explore—the city of lights awaits.",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),

              // Destination 4
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/destination_details',
                    arguments: {
                      "title": "Istanbul, Turkey",
                      "image": 'assets/istabul.jpg',
                      "description":
                          "Discover Sidi Bou Said with stunning views, local charm, and authentic cuisine. Relax or explore—the perfect escape awaits.",
                    },
                  );
                },
                child: Card(
                  elevation: 4,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/istunbul.jpg',
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
                              "Istanbul , Turkey",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "Experience Istanbul with luxurious stays, breathtaking views, and rich culture. Relax or explore—an unforgettable adventure awaits.",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey),
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
        selectedItemColor:
            const Color.fromARGB(255, 52, 27, 97), // Selected item color
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
          BottomNavigationBarItem( icon: Icon(Icons.search_sharp), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: "Fav"),
          BottomNavigationBarItem(icon: Image.asset('assets/avv.png', width: 24,height: 24,),label: "Profile ",),
        ],
      ),
    );
  }
}
