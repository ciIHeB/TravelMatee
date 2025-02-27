import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:azer/favorites_provider.dart';

class parispage extends StatelessWidget {
@override
  Widget build(BuildContext context) {
     var favoritesProvider = Provider.of<FavoritesProvider>(context);
    bool isFavorite = favoritesProvider.isFavorite("Eiffel Dream Retreat");
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Logo

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

        iconTheme: IconThemeData(color: Colors.black), // Icon color
        actions: [
          IconButton(
             onPressed: () 
              {
                favoritesProvider.toggleFavorite
                (
                  Destination(
                    name: "Eiffel Dream Retreat",
                    imagePath: 'assets/paris.jpg',
                    description: "Luxurious stays in the heart of Paris.",
                    route: '/paris',
                  ),
                );
              },
              icon: Icon(
            favoritesProvider.isFavorite("Eiffel Dream Retreat")
                ? Icons.favorite  // Filled heart when saved
                : Icons.favorite_border, // Outlined heart when not saved
            color: favoritesProvider.isFavorite("Eiffel Dream Retreat")
                ? Colors.red  // Red when saved
                : Colors.grey, // Grey when not saved
          ),
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
              'assets/paris.jpg',
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(17.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Eiffel Dream Retreat",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.blue,
                      ),
                      Text("Paris, France"),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow),
                      Text(" 4.8 • 2,145 reviews"),
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
                    
"Experience the magic of Paris with luxurious stays, iconic city views, and exquisite dining. Unwind in style or immerse yourself in the city's rich culture—an unforgettable Parisian escape.",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
            Center(
              child: GestureDetector(
                onTap: () {
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
            ),
          ],
        ),
      ),
    );
  }
}
